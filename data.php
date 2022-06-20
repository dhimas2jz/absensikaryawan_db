<?php include_once('../../_header.php'); ?>

	<div class="box">
		<h1>Laporan Pemesanan</h1>
		<hr>
		<h4>
			<small>Laporan Data pemesanan</small>
		</h4>
		<div class="table-responsive">
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th><center>No</center></th>
						<th><center>Kode Pemesanan</center></th>
						<th><center>Tanggal Pemesanan</center></th>
						<th><center>Tempat Pemesanan</center></th>
						<th><center>Kode Kursi</center></th>
						<th><center>Tujuan</center></th>
						<th><center>Tanggal Berangkat</center></th>
						<th><center>Jam Berangkat</center></th>
						<th><center>Total Bayar</center></th>
					</tr>
				</thead>
				<tbody>
				<?php
				$batas = 5;
				$hal = @$_GET['hal'];
				if(empty($hal)) {
					$posisi = 0;
					$hal = 1;
				} else {
					$posisi = ($hal - 1) * $batas;
				}
				$no = 1;
				if($_SERVER['REQUEST_METHOD'] == "POST") {
					$pencarian = trim(mysqli_real_escape_string($con, $_POST['pencarian']));
					if($pencarian != '') {
						$sql = "SELECT * FROM tb_pemesanan WHERE kode_pemesanan LIKE '%$pencarian%'";
						$query = $sql;
						$queryJml = $sql;
					} else {
						$query = "SELECT * FROM tb_pemesanan LIMIT $posisi, $batas";
						$queryJml = "SELECT * FROM tb_pemesanan";
						$no = $posisi + 1;
					}
				} else {
					$query = "SELECT * FROM tb_pemesanan LIMIT $posisi, $batas";
					$queryJml = "SELECT * FROM tb_pemesanan";
					$no = $posisi + 1;
				}
				
				$sql_pemesanan = mysqli_query($con, $query) or die (mysqli_error($con));
				if(mysqli_num_rows($sql_pemesanan) > 0) {
					while($data = mysqli_fetch_array($sql_pemesanan)) { ?>
						<tr>
							<td><?=$no++?></td>
							<td><?=$data['kode_pemesanan']?></td>
							<td><?=$data['tanggal_pemesanan']?></td>
							<td><?=$data['tempat_pemesanan']?></td>
							<td><?=$data['kode_kursi']?></td>
							<td><?=$data['tujuan']?></td>
							<td><?=$data['tanggal_berangkat']?></td>
							<td><?=$data['jam_berangkat']?></td>
							<td>Rp.<?= number_format($data['total_bayar'],2,',','.')?></td>
						</tr>
					<?php
					}
				} else {
					echo "<tr><td colspan=\"11\" align=\"center\">Data tidak ditemukan</td></tr>";
				}
				?>
				</tbody>
			</table>
		</div>
				</ul>
			</div>
	</div>



	<script>
 $(document).ready(function() {  
   $('.table').DataTable( {  
     dom: 'Bfrtip',  
     buttons: [  
       'copy', 'csv', 'excel', 'pdf', 'print'  
     ]  
   } );  
 } );  
	</script>

<?php include_once('../../_footer.php'); ?>