<?php 
	print_r($_REQUEST);
	include_once("includes/header.php"); 
	if($_SESSION['login'] != 1) {
		header("Location:login.php?msg=Login first to book your room !!!");
	} 
	$R = $_REQUEST;
	if(isset($R['book_from_date'])) {
		$SQL="SELECT * FROM room,category where room_category_id = category_id";
		$rs=mysqli_query($con,$SQL) or die(mysqli_error($con));
	}
	global $SERVER_PATH;
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
	<div class="crumb">
    </div>
    <div class="clear"></div>
	<div id="content_sec">
		<div class="col1">
			<div class="contact">
				<h4 class="heading colr">Search Room</h4>
				<form action="book_room.php" enctype="multipart/form-data" method="post" name="frm_room">
					<ul class="forms">
						<li class="txt">From Data</li>
						<li class="inputfield"><input name="book_from_date" id="book_from_date" type="text" class="bar" required/></li>
					</ul>
					<ul class="forms">
						<li class="txt">To Date</li>
						<li class="inputfield"><input name="book_to_date" id="book_to_date" type="text" class="bar" required/></li>
					</ul>
					<ul class="forms">
						<li class="txt">No. Of Rooms</li>
						<li class="inputfield"><input name="book_no_rooms" id="drop_off" type="text" class="bar" required/></li>
					</ul>
					<ul class="forms">
						<li class="txt">No. Of Persons</li>
						<li class="inputfield"><input name="book_no_persons" id="drop_off" type="text" class="bar" required/></li>
					</ul>
					<ul class="forms">
						<li class="txt">No. Of Childs</li>
						<li class="inputfield"><input name="book_no_childs" id="drop_off" type="text" class="bar" required/></li>
					</ul>
					<div class="clear"></div>
					<ul class="forms">
						<li class="txt">&nbsp;</li>
						<li class="textfield"><input type="submit" value="Search Room" class="simplebtn"></li>
						<li class="textfield"><input type="reset" value="Reset" class="resetbtn"></li>
					</ul>
					<input type="hidden" name="act" value="save_room">
					<input type="hidden" name="room_id" value="<?=$data[room_id]?>">
				</form>
			</div>
			<?php if($_REQUEST['book_from_date']) { ?>
			<div class="cartsecs" style="clear:both; width:100%">
				<h4 class="heading colr">Choose Your Room</h4>
				<?php if(!mysqli_num_rows()) { ?>
					<!--No Car Found. Choose different date range !!! -->
				<?php } ?>
				<ul>
				<?php
					while($data = mysqli_fetch_assoc($rs))
					{
				?>
					<li>
						<div class="thumb">
							<a href="#"><img src="<?=$SERVER_PATH.'uploads/'.$data[room_image]?>" alt="" style="width:92px; height:78px"/></a>
						</div>
						<div class="conts">
							<a href="#" class="black bold"><?=$data[room_title]?></a>
							<p>Room Type : <?=$data[category_name]?></p>
							<p class="bold">Max Adults : <?=$data[room_max_adult]?></p>
							<p class="bold">Max Childs : <?=$data[room_max_child]?></p>
						</div>
						<div style="float:right; padding:20px 57px 20px 100px; border-left:1px solid #cccccc">
							<a href="booking_details.php?room_id=<?=$data[room_id]?>&book_from_date=<?=$_REQUEST['book_from_date'];?>&book_to_date=<?=$_REQUEST['book_to_date'];?>&book_no_rooms=<?=$_REQUEST['book_no_rooms'];?>&book_no_persons=<?=$_REQUEST['book_no_persons'];?>&book_no_childs=<?=$_REQUEST['book_no_childs'];?>" class="simplebtn left">Book The Room Now</a>
						</div>
					</li>
					<?php } ?>
				</ul>
				<div class="clear"></div>
			</div>
			<?php } ?>
		</div>
		<div class="col2">
			<?php include_once("includes/sidebar.php"); ?> 
		</div>
	</div>
<?php include_once("includes/footer.php"); ?> 