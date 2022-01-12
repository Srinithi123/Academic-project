<?php 
	include_once("includes/header.php"); 
	include_once("includes/db_connect.php"); 
	if($_SESSION['user_details']['user_level_id'] == 2)
	{
		$SQL = "SELECT * FROM book,room,category WHERE room_category_id = category_id AND book_room_id = room_id AND book_user_id = ".$_SESSION['user_details']['user_id'];
	}
	else
	{
		$SQL = "SELECT * FROM book,room,category WHERE room_category_id = category_id AND book_room_id = room_id";
	}
	
	$rs = mysqli_query($con,$SQL) or die(mysqli_error($con));
?>
<script>
function delete_category(category_id)
{
	if(confirm("Do you want to delete the category?"))
	{
		this.document.frm_category.category_id.value=category_id;
		this.document.frm_category.act.value="delete_category";
		this.document.frm_category.submit();
	}
}
</script>
	<div class="crumb">
    </div>
    <div class="clear"></div>
	<div id="content_sec">
		<div class="col1" style="width:100%">
		<div class="contact">
			<h4 class="heading colr">Booking Report</h4>
			<?php
			if($_REQUEST['msg']) { 
			?>
				<div class="msg"><?=$_REQUEST['msg']?></div>
			<?php
			}
			?>
			<form name="frm_category" action="lib/category.php" method="post">
				<div class="static">
					<table style="width:100%">
					  <tbody>
					  <tr class="tablehead bold">
					    <td scope="col">Booking ID</td>
						<td scope="col">Name</td>
						<td scope="col">Room Type</td>
						<td scope="col">From Date</td>
						<td scope="col">To Date</td>
						<td scope="col">Amount</td>
						<td scope="col">Adults</td>
						<td scope="col">Childs</td>
						<td scope="col">Action</td>
					  </tr>
					<?php 
					$sr_no=1;
					while($data = mysqli_fetch_assoc($rs))
					{
					?>
					  <tr>
						<td>10000<?=$data[book_id]?></td>
						<td><?=$data[book_name]?></td>
						<td><?=$data[category_name]?></td>
						<td><?=$data[book_from_date]?></td>
						<td><?=$data[book_to_date]?></td>
						<td><?=$data[book_total_amount]?>/-</td>
						<td><?=$data[book_no_persons]?> Adults</td>
						<td><?=$data[book_no_childs]?> Children</td>
						<td style="text-align:center">
							<a href="booking-confirmation.php?book_id=<?php echo $data[book_id] ?>">View</a></td>
						</td>
					  </tr>
					<?php } ?>
					</tbody>
					</table>
				</div>
				<input type="hidden" name="act" />
				<input type="hidden" name="category_id" />
			</form>
		</div>
		</div>
	</div>
<?php include_once("includes/footer.php"); ?> 