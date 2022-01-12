<?php 
	include_once("includes/header.php"); 
	if($_REQUEST[room_id])
	{
		$SQL="SELECT * FROM room,category WHERE room_category_id = category_id AND room_id = $_REQUEST[room_id]";
		$rs=mysqli_query($con,$SQL) or die(mysqli_error($con));
		$data=mysqli_fetch_assoc($rs);
	}
	$R = $_REQUEST;
	$userData = $_SESSION['user_details'];
?> 
<script>
  jQuery(function() {
    jQuery( "#book_from_date" ).datepicker({
      changeMonth: true,
      changeYear: true,
       yearRange: "-0:+1",
       dateFormat: 'yy-mm-dd'
    });
	jQuery( "#book_to_date" ).datepicker({
      changeMonth: true,
      changeYear: true,
       yearRange: "-0:+1",
       dateFormat: 'yy-mm-dd'
    });
  });
</script>
<style>
td{
	padding:5px;
	text-align:center;
	boder:1px solid;
	margin:1px;
	border:1px solid #101746;
}
th {
	font-weight:bold;
	color:#ffffff;
	font-size:12px;
	background-color:#bf3c22;
	padding:5px;
}
</style>
	<div class="crumb">
    </div>
    <div class="clear"></div>
	<div id="content_sec">
		<div class="col1">
			<div class="news">
			<h4 class="heading colr">Selected Room Details</h4>
				<div class="featured_news">
					<div class="thumb"><span class="featured">&nbsp;</span><a href="#"><img src="<?=$SERVER_PATH.'uploads/'.$data[room_image]?>" alt="" style="width:149px; height:149px" /></a></div>
					<div class="cont">
						<p class="featuredate"><?=$data['category_name']?></p>
						<h4><?=$data[room_title]?></h4>
						<table style="border:1px solid; width:100%">
							<tr>
								<th>Price Per Day</th>
								<td><?=$data[room_fare]?>/-</td>
							</tr>
							<tr>
								<th>Room Type</th>
								<td><?=$data[category_name]?></td>
							</tr>
							<tr>
								<th>Max Adults</th>
								<td><?=$data[room_max_adult]?></td>
							</tr>
							<tr>
								<th>Max Childs</th>
								<td><?=$data[room_max_child]?></td>
							</tr>
							<tr>
								<th>Number of Beds</th>
								<td><?=$data[room_no_of_beds]?></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="contact">
				<h4 class="heading colr">Book Your Room (Review Your Booking Details)</h4>
				<form action="lib/booking.php" enctype="multipart/form-data" method="post" name="frm_room">
					<ul class="forms">
						<li class="txt">From Data</li>
						<li class="inputfield"><input name="book_from_date" id="book_from_date" type="text" class="bar" value="<?=$R['book_from_date']?>" required/></li>
					</ul>
					<ul class="forms">
						<li class="txt">To Date</li>
						<li class="inputfield"><input name="book_to_date" id="book_to_date" type="text" class="bar" value="<?=$R['book_to_date']?>" required/></li>
					</ul>
					<ul class="forms">
						<li class="txt">No. Of Rooms</li>
						<li class="inputfield"><input name="book_no_rooms" id="book_no_rooms" type="text" class="bar" value="<?=$R['book_no_rooms']?>" required/></li>
					</ul>
					<ul class="forms">
						<li class="txt">No. Of Persons</li>
						<li class="inputfield"><input name="book_no_persons" id="book_no_persons" type="text" class="bar" value="<?=$R['book_no_persons']?>" required/></li>
					</ul>
					<ul class="forms">
						<li class="txt">No. Of Childs</li>
						<li class="inputfield"><input name="book_no_childs" id="book_no_childs" type="text" class="bar" value="<?=$R['book_no_childs']?>" required/></li>
					</ul>
					<ul class="forms">
						<li class="txt">Name</li>
						<li class="inputfield"><input name="book_name" type="text" class="bar" value="<?=$userData['user_name']?>" required/></li>
					</ul>
					<ul class="forms">
						<li class="txt">Mobile</li>
						<li class="inputfield"><input name="book_mobile" type="text" class="bar" required  value="<?=$userData['user_mobile']?>"/></li>
					</ul>
					<ul class="forms">
						<li class="txt">Email</li>
						<li class="inputfield"><input name="book_email" type="text" class="bar" required value="<?=$userData['user_email']?>"/></li>
					</ul>
					<div class="clear"></div>
					<ul class="forms">
						<li class="txt">&nbsp;</li>
						<li class="textfield"><input type="submit" value="Book My Room" class="simplebtn"></li>
						<li class="textfield"><input type="reset" value="Reset" class="resetbtn"></li>
					</ul>
					<input type="hidden" name="book_room_id" value="<?=$R[room_id]?>">
					<input type="hidden" name="act" value="save_book">
				</form>
			</div>
		</div>
		<div class="col2">
			<?php include_once("includes/sidebar.php"); ?> 
		</div>
	</div>
<?php include_once("includes/footer.php"); ?> 