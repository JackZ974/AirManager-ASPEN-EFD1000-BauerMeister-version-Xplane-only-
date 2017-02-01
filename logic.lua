--**************************************--
------------------------------------------
-- This is a Aspen EFD1000 inspired EFD --
-- Made by Ralph with help from Corjan  --
-- Modified by Marc  
-- (Forum User BauerMeister)                   --
------------------------------------------
--**************************************--

----------------------
-- Global variables --
----------------------
dhwarning = true
altwarning = true
nav1flag = true
nav2flag = true
off_flag = false
nav1freq = 11178
nav2freq = 11630
gps_bear = 100
gps_dme = 23
nav1_bear = 0
nav2_bear = 0
press_right_flag = false
menu = 0
autocrs = false
hsi = true
hsi_store = hsi
button_menu = false
knob_left_mode = 0
knob_right_mode = 0
button_left_mode = 0
button_right_mode = 0
brightness = 70
mode_right_1_1 = 0
mode_right_1_2 = 0
mode_right_1_3 = 0
mode_right_1_4 = 0
mode_right_1_5 = 0
mode_right_2_2 = 0
mode_right_2_3 = 0
mode_right_2_4 = 0
ils1_freq = false
ils2_freq = false
gps_nav_id =""
gps_dme_time = 0
minimum = 200
pfd_pwr_flag = false
course = 0
bc_flag = false
timer_right_sync = nil
timer_left_sync = nil
baro_alt = 0
rad_sync_flag = false
vne_flag = false
avionics_pwr_flag = false
brt_auto = true
downtime = 15
rev_button_flag = false
alt_flag = false
alt_flag2 = true
menu_2_2_flag = false
--vfe = 85
--vso = 47

---------------------------
-- Add images in Z-order --
---------------------------
img_horizon = img_add("horizon.png", -280, -1024, 1500, 3000)
img_horizonscale = img_add("horizonscale.png", -280, -1024, 1500, 3000)
img_flightdirector = img_add("flightdirector.png", 292, 476, 354, 56)
img_roll = img_add("roll.png", 162, 168, 616, 616)
img_add_fullscreen("background_full.png")
img_comp_back = img_add("comp_back.png", 186, 878, 571, 509)
img_slip = img_add("slip.png", 455, 225, 30, 8)
img_spdyellow = img_add("speedyellow.png", 165, -314, 10, 511)
img_spdred = img_add("speedred.png", 165, -314, 10, 511)
img_spdgreen = img_add("speedgreen.png", 165, 196, 10, 511)
img_spdwhite = img_add("speedwhite.png", 158, 196, 10, 511)
img_arrow1 = img_add("arrow1.png", 222, 1390, 23, 32)
img_arrow2 = img_add("arrow2.png", 700, 1390, 23, 32)
img_vsi_scale = img_add("vsi_scale.png", 780, 860, 50, 506)
img_vsi = img_add("vsi.png", 780, 860, 50, 506)
img_vsi_trend = img_add("vsi_trend.png", 720, 195, 34, 515)
img_mask = img_add("mask.png", 70, 1388, 803, 48)
img_cdi = img_add("cdi_scale.png", 347, 1345, 250, 51)
img_vert_scale = img_add("vert_scale.png", 680, 373, 34, 207)
img_hor_scale = img_add("hor_scale.png", 364, 710, 207, 34)
img_cdi_raute = img_add("raute.png", 420, 1345,28, 51)
img_cdi_raute_off = img_add("raute_off.png", 345, 1345,28, 51)
img_raute_hor = img_add("raute_hor.png", 456, 687,26, 47)
img_raute_hor_off = img_add("raute_hor_off.png", 456, 687, 26, 47)
img_raute_vert = img_add("raute_hor.png", 656, 462,47, 26)
img_raute_vert_off = img_add("raute_hor_off.png", 656, 462, 47, 26)
img_needle = img_add("vorneedle.png", 356, 889, 228, 440)
img_needle_arc1 = img_add("vorneedle_arc1.png", 356, 1029, 228, 700)
img_needle_arc2 = img_add("vorneedle_arc2.png", 356, 879, 228, 1000)
img_needle_to = img_add("vorneedle_to.png", 356, 889, 228, 440)
img_needle_fr = img_add("vorneedle_fr.png", 356, 889, 228, 440)
img_needle_to_arc1 = img_add("vorneedle_to_arc1.png", 356, 1029, 228, 700)
img_needle_to_arc2 = img_add("vorneedle_to_arc2.png", 356, 879, 228, 1000)
img_needle_fr_arc1 = img_add("vorneedle_fr_arc1.png", 356, 1029, 228, 700)
img_needle_fr_arc2 = img_add("vorneedle_fr_arc2.png", 356, 879, 228, 1000)
img_center_needle = img_add("hsi_center_needle.png", 460, 855, 20, 204)
img_center_needle_arc1 = img_add("hsi_center_needle_arc1.png", 460, 1200, 20, 340)
img_center_needle_arc2 = img_add("hsi_center_needle_arc2.png", 460, 1160, 20, 435)
img_center_needle_off = img_add("hsi_center_needle_off.png", 460, 855, 20, 204)
img_center_needle_off_arc1 = img_add("hsi_center_needle_off_arc1.png", 460, 1200, 20, 340)
img_center_needle_off_arc2 = img_add("hsi_center_needle_off_arc2.png", 460, 1160, 20, 435)
img_ils1_eadi = img_add("ils1_eadi.png", 260, 685, 88, 30)
img_loc1_eadi = img_add("loc1_eadi.png", 260, 685, 88, 30)
img_bc1_eadi = img_add("bc1_eadi.png", 260, 685, 88, 30)
img_reddash_eadi = img_add("red_dash.png",264,696,80,10)
--img_add("test.png", 729, 197, 32,510)

visible(img_raute_hor, false)
visible(img_raute_hor_off, false)
visible(img_raute_vert, true)
visible(img_raute_vert_off, false)
visible(img_cdi_raute, false)
visible(img_cdi_raute_off, false)
visible(img_hor_scale, false)
visible(img_vert_scale, false)
visible(img_cdi, false)
visible(img_needle, false)
visible(img_needle_to, false)
visible(img_needle_fr, false)
visible(img_needle_arc1, false)
visible(img_needle_arc2, false)
visible(img_needle_to_arc1, false)
visible(img_needle_to_arc2, false)
visible(img_needle_fr_arc1, false)
visible(img_needle_fr_arc2, false)
visible(img_cdi_needle, false)
visible(img_center_needle, false)
visible(img_center_needle_arc1, false)
visible(img_center_needle_arc2, false)
visible(img_center_needle_off, false)
visible(img_center_needle_off_arc1, false)
visible(img_center_needle_off_arc2, false)
visible(img_ils1_eadi, false)
visible(img_loc1_eadi, false)
visible(img_bc1_eadi, false)
visible(img_reddash_eadi, false)

-- Running text and images for speed and altitude
function item_value_callback_speed(i)
    return string.format("%d", 0 - (i * 10) )
end

running_text_speed = running_txt_add_ver(70,130,10,68,66,item_value_callback_speed,"-fx-font-size:28px; -fx-font-family:Arial; -fx-fill:white; -fx-text-alignment:right;")
running_img_speed  = running_img_add_ver("speedimage.png",141,146,10,34,66)

running_img_move_carot(running_img_speed, 0)
running_txt_move_carot(running_text_speed, 0)

function item_value_callback_alt(i)
	return string.format("%d", i * 100 * -1 )
end

running_text_alt = running_txt_add_ver(780,-4,8,80,116,item_value_callback_alt,"-fx-font-size:28px; -fx-font-family:Arial; -fx-fill:white; -fx-text-alignment:right;")
running_img_alt  = running_img_add_ver("altimage.png",733,128,6,31,116)

running_img_move_carot(running_img_alt, 0)
running_txt_move_carot(running_text_alt, 0)

-------------------------------------------------
img_yellow_triangle = img_add("yellow_triangle.png", 729, 358-232, 32,123)
img_red_triangle = img_add("red_triangle.png", 729, 264, 32,50)
img_green_triangle = img_add("green_triangle.png", 729, 264, 32,50)
img_altmarker = img_add("altmarker.png", 733, 147, 16, 50)
img_altmarker_mag = img_add("altmarker_mag.png", 733, 147, 16, 50)
img_speedmarker = img_add("altmarker.png", 150, 147, 16, 50)
img_speedmarker_mag = img_add("altmarker_mag.png", 150, 147, 16, 50)
img_add("speedbox.png", 70, 421, 93, 110)
img_add("altbox.png", 734, 421, 137, 110)
img_dh = img_add("dhind.png", 285, 179, 34, 34)
img_windarrow = img_add("windarrow.png", 590, 761, 20, 30)
img_compas_arc = img_add("compas_arc.png", -36, 862, 1012, 1012)
img_compasrose = img_add("compasrose.png", 217, 856, 506, 506)
img_turnleft = img_add("turnindbar.png", 202, 841, 536, 536)
img_turnright = img_add("turnindbar.png", 202, 841, 536, 536)
img_turnleft_arc = img_add("turnindbar_arc.png", -56, 844, 1052, 1052)
img_turnright_arc = img_add("turnindbar_arc.png", -56, 844, 1052, 1052)
img_turnind = img_add("turnindicator.png", 372, 829, 196, 42)
img_turnind_arc = img_add("turnindicator_arc.png", 260, 829, 420, 73)
img_degreebox = img_add("degreebox.png", 414, 800, 112, 78)
img_gps1 = img_add("gps1.png", 70, 800, 87, 36)
img_nav1 = img_add("nav1.png", 70, 800, 87, 36)
img_nav2 = img_add("nav2.png", 70, 800, 87, 36)
img_ils1 = img_add("ils1.png", 70, 800, 87, 36)
img_auto_crs = img_add("autocrs.png", 266, 796, 28, 28)
img_auto_crs2 = img_add("autocrs.png",76, 1393, 36, 36)
--img_menu_1_1_0 = img_add("menu_1-2.png", 846, 795, 24, 119)
img_menu_1_1_0 = img_add("menu_green.png", 846, 795, 24, 119)  --menu 1-2 nicht notwendig, weil keine Funktionen
img_menu_1_1_1 = img_add("menu_2-2.png", 846, 795, 24, 119)
img_menu_1_2_0 = img_add("menu_minimum_dis.png", 846, 914, 24, 119)
img_menu_1_2_1 = img_add("menu_minimum_en.png", 846, 914, 24, 119)
img_menu_1_3_0 = img_add("menu_360.png", 846, 1033, 24, 119)
img_menu_1_3_1 = img_add("menu_arc.png", 846, 1033, 24, 119)
img_menu_1_4_0 = img_add("menu_gpss_off.png", 846, 1152, 24, 119)
img_menu_1_4_1 = img_add("menu_gpss_on.png", 846, 1152, 24, 119)
img_menu_1_5_0 = img_add("menu_baro_dis.png", 846, 1270, 24, 119)
img_menu_1_5_1 = img_add("menu_baro_en.png", 846, 1270, 24, 119)
img_menu_2_2_0 = img_add("menu_ltng_off.png", 846, 914, 24, 119)
img_menu_2_3_0 = img_add("menu_nxrd_off.png", 846, 1033, 24, 119)
img_menu_2_4_0 = img_add("menu_trfc_off.png", 846, 1152, 24, 119)
img_minimum = img_add("minimum.png", 595, 600, 130, 90)
img_minimum_sel = img_add("minimum_sel.png", 595, 600, 130, 90)
img_power_off = img_add("power_off.png", 640, 235, 225, 40)
img_battery_level = img_add("battery_level.png", 72, 200, 144, 58)
img_apaltbox = img_add("apaltbox.png", 692, 155, 179, 42)

visible(img_yellow_triangle, false)
visible(img_red_triangle, false)
visible(img_green_triangle, false)
visible(img_compasrose, false)
visible(img_comp_back, false)
visible(img_turnind, false)
visible(img_vsi, false)
visible(img_vsi_scale, false)
visible(img_mask, false)
visible(img_minimum, false)
visible(img_minimum_sel, false)
visible(img_power_off, false)
visible(img_battery_level, false)
visible(img_altmarker_mag, false)
visible(img_speedmarker_mag, false)
-------------
-- PRESETS --
-------------

if mode_right_1_1 == 0 then
	visible(img_menu_1_1_0, true)
	visible(img_menu_1_1_1, false)	
	visible(img_menu_2_2_0, false)
	visible(img_menu_2_3_0, false)
	visible(img_menu_2_4_0, false)
	if mode_right_1_2 == 0 then
		visible(img_menu_1_2_0, true)
		visible(img_menu_1_2_1, false)	
	else
		visible(img_menu_1_2_1, false)
		visible(img_menu_1_2_0, true)
	end
	if mode_right_1_4 == 0 then
		visible(img_menu_1_4_0, true)
		visible(img_menu_1_4_1, false)	
	else
		visible(img_menu_1_4_0, false)
		visible(img_menu_1_4_1, true)
	end
	if mode_right_1_5 == 0 then
		visible(img_menu_1_5_0, true)
		visible(img_menu_1_5_1, false)	
	else
		visible(img_menu_1_5_0, false)
		visible(img_menu_1_5_1, true)
	end
else
	visible(img_menu_1_2_1, false)
	visible(img_menu_1_2_0, true)
	visible(img_menu_2_2_0, true)
	visible(img_menu_2_3_0, true)
	visible(img_menu_2_4_0, true)
	
end

--------------
-- Add text --
--------------
-- Infobar top
txt_apspd = txt_add(" ", "-fx-font-size:30px; -fx-font-family:Arial; -fx-fill: aqua; -fx-font-weight:bold; -fx-text-alignment:right;", 75, 160, 90, 100)
txt_apalt = txt_add("", "-fx-font-size:30px; -fx-font-family:Arial; -fx-fill: aqua; -fx-font-weight:bold; -fx-text-alignment:right;", 760, 160, 90, 100)
-- Infobar center
txt_add("TAS", "-fx-font-size:20px; -fx-font-family:Arial; -fx-fill: white; -fx-font-weight:bold; -fx-text-alignment:left;", 75, 725, 150, 100)
txt_tas = txt_add(" ", "-fx-font-size:30px; -fx-font-family:Arial; -fx-fill: white; -fx-font-weight:bold; -fx-text-alignment:right;", 90, 717, 120, 100)
txt_add("GS", "-fx-font-size:20px; -fx-font-family:Arial; -fx-fill: white; -fx-font-weight:bold; -fx-text-alignment:left;", 85, 770, 150, 100)
txt_gs = txt_add(" ", "-fx-font-size:30px; -fx-font-family:Arial; -fx-fill: white; -fx-font-weight:bold; -fx-text-alignment:right;", 90, 762, 120, 100)
txt_add("OAT", "-fx-font-size:20px; -fx-font-family:Arial; -fx-fill: white; -fx-font-weight:bold; -fx-text-alignment:left;", 270, 770, 150, 100)
txt_oat = txt_add(" ", "-fx-font-size:30px; -fx-font-family:Arial; -fx-fill: white; -fx-font-weight:bold; -fx-text-alignment:right;", 270, 762, 120, 100)
txt_wind = txt_add(" ", "-fx-font-size:30px; -fx-font-family:Arial; -fx-fill: white; -fx-font-weight:bold; -fx-text-alignment:right;", 570, 762, 200, 100)
txt_inhg = txt_add(" ", "-fx-font-size:30px; -fx-font-family:Arial; -fx-fill: aqua; -fx-font-weight:bold; -fx-text-alignment:right;", 730, 717, 140, 40)
-- Navigation
txt_compheading = txt_add(" ", "-fx-font-size:49px; -fx-font-family:Arial; -fx-fill: white; -fx-font-weight:bold; -fx-text-alignment:center;", 396, 795, 150, 100)
txt_add("CRS", "-fx-font-size:24px; -fx-font-family:Arial; -fx-fill: white; -fx-font-weight:bold; -fx-text-alignment:right;", 149, 797, 200, 100)
txt_course = txt_add(" ", "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill: aqua; -fx-font-weight:bold; -fx-text-alignment:right;", 167, 822, 200, 100)
txt_add("HDG", "-fx-font-size:24px; -fx-font-family:Arial; -fx-fill: white; -fx-font-weight:bold; -fx-text-alignment:right;", 437, 797, 200, 100)
txt_hdg = txt_add(" ", "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill: aqua; -fx-font-weight:bold; -fx-text-alignment:right;", 453, 822, 200, 100)
txt_vsi = txt_add("", "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill: white; -fx-font-weight:bold; -fx-text-alignment:right;", 628, 797, 200, 100)
txt_add("FPM", "-fx-font-size:26px; -fx-font-family:Arial; -fx-fill: white; -fx-font-weight:bold; -fx-text-alignment:right;", 628, 830, 200, 100)
txt_source = txt_add("GPS1", "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill: #5fce4b; -fx-font-weight:bold; -fx-text-alignment:center;", 368, 1393, 200, 100)
txt_source_left = txt_add(" ", "-fx-font-size:30px; -fx-font-family:Arial; -fx-fill: aqua; -fx-font-weight:bold; -fx-text-alignment:center;", 210, 1389, 200, 100)
txt_source_right = txt_add(" ", "-fx-font-size:30px; -fx-font-family:Arial; -fx-fill: aqua; -fx-font-weight:bold; -fx-text-alignment:center;", 545, 1389, 200, 100)
txt_knob_left = txt_add("CRS", "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill: aqua; -fx-font-weight:bold; -fx-text-alignment:center;", 92, 1393, 96, 100)
txt_knob_right = txt_add("HDG", "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill: aqua; -fx-font-weight:bold; -fx-text-alignment:center;", 705, 1393, 200, 100)
txt_nav_line1 = txt_add(" ", "-fx-font-size:30px; -fx-font-family:Arial; -fx-fill: #00ff00; -fx-font-weight:bold; -fx-text-alignment:left;",70, 834, 140, 38)
txt_nav_line2 = txt_add(" ", "-fx-font-size:30px; -fx-font-family:Arial; -fx-fill: #00ff00; -fx-font-weight:bold; -fx-text-alignment:left;",70, 864, 140, 38)
txt_nav_line3 = txt_add(" ", "-fx-font-size:30px; -fx-font-family:Arial; -fx-fill: #00ff00; -fx-font-weight:bold; -fx-text-alignment:left;",70, 894, 140, 38)
txt_button_left_line1 = txt_add(" ", "-fx-font-size:28px; -fx-font-family:Arial; -fx-fill: aqua; -fx-font-weight:bold; -fx-text-alignment:left;",210, 1358, 140, 38)
txt_button_left_line2 = txt_add(" ", "-fx-font-size:28px; -fx-font-family:Arial; -fx-fill: aqua; -fx-font-weight:bold; -fx-text-alignment:left;",210, 1328, 140, 38)
txt_button_right_line1 = txt_add(" ", "-fx-font-size:28px; -fx-font-family:Arial; -fx-fill: aqua; -fx-font-weight:bold; -fx-text-alignment:right;",592, 1358, 140, 38)
txt_button_right_line2 = txt_add(" ", "-fx-font-size:28px; -fx-font-family:Arial; -fx-fill: aqua; -fx-font-weight:bold; -fx-text-alignment:right;",592, 1328, 140, 38)
txt_auto = txt_add("AUTO", "-fx-font-size:31px; -fx-font-family:Arial; -fx-fill: #00ff00; -fx-font-weight:bold; -fx-text-alignment:left;", 75, 1403, 140, 36)
txt_brt = txt_add("BRT:", "-fx-font-size:31px; -fx-font-family:Arial; -fx-fill: #00ff00; -fx-font-weight:bold; -fx-text-alignment:left;", 75, 1375, 140, 36)
var_brt = txt_add(brightness, "-fx-font-size:31px; -fx-font-family:Arial; -fx-fill: #00ff00; -fx-font-weight:bold; -fx-text-alignment:right;", 150, 1375, 55, 36)
txt_manual = txt_add("PUSH MANUAL", "-fx-font-size:21px; -fx-font-family:Arial; -fx-fill: #f0f0f0; -fx-font-weight:bold; -fx-text-alignment:left;", 75, 1355, 300, 36)
txt_genset = txt_add("GENERAL SETTINGS A", "-fx-font-size:31px; -fx-font-family:Arial; -fx-fill: #00ff00; -fx-font-weight:bold; -fx-text-alignment:center;", 205, 1384, 500, 36)
txt_page = txt_add("SEL PAGE", "-fx-font-size:31px; -fx-font-family:Arial; -fx-fill: magenta; -fx-font-weight:bold; -fx-text-alignment:right;", 665, 1403, 200, 36)
txt_page_no = txt_add("PAGE 1 of 11", "-fx-font-size:21px; -fx-font-family:Arial; -fx-fill: #00ff00; -fx-font-weight:bold; -fx-text-alignment:right;", 665, 1380, 200, 36)
txt_raute_fr = txt_add("FROM", "-fx-font-size:21px; -fx-font-family:Arial; -fx-fill: #00ff00; -fx-font-weight:normal; -fx-text-alignment:right;", 460, 1360, 200, 36)
txt_raute_to = txt_add("TO", "-fx-font-size:21px; -fx-font-family:Arial; -fx-fill: #00ff00; -fx-font-weight:normal; -fx-text-alignment:right;", 135, 1360, 200, 36)
txt_cdi_bc1 = txt_add("BC1", "-fx-font-size:21px; -fx-font-family:Arial; -fx-fill: #00ff00; -fx-font-weight:normal; -fx-text-alignment:right;", 135, 1360, 200, 36)
txt_minimum = txt_add(" ", "-fx-font-size:42px; -fx-font-family:Arial; -fx-fill: cyan; -fx-font-weight:bold; -fx-text-alignment:center;", 508, 642, 300, 60)
txt_set(txt_minimum, minimum)
txt_timer_down = txt_add("IN 0:"..downtime, "-fx-font-size:22px; -fx-font-family:Arial; -fx-fill: black; -fx-font-weight:bold; -fx-text-alignment:right;", 91, 230, 90, 100)

img_reddash = img_add("red_dash.png",412,1408,110,10)
img_reddash_left = img_add("red_dash.png",262,1402,95,10)
img_reddash_right = img_add("red_dash.png",600,1402,95,10)

visible(txt_page_no, false)
visible(txt_auto, false)
visible(txt_brt, false)
visible(var_brt, false)
visible(txt_manual, false)
visible(txt_genset, false)
visible(txt_page, false)
visible(txt_raute_fr, false)
visible(txt_raute_to, false)
visible(txt_cdi_bc1, false)
visible(txt_minimum, false)
visible(txt_timer_down, false)


-- Button at bottom
function button_menu_press()
	if button_menu == false then
		button_menu = true
		timer_right()
		timer_left()
		visible(img_menu_1_1_0, false)
		visible(img_menu_1_1_1, false)
		visible(img_menu_1_2_0, false)
		visible(img_menu_1_2_1, false)
		visible(img_menu_1_3_0, false)
		visible(img_menu_1_3_1, false)
		visible(img_menu_1_4_0, false)
		visible(img_menu_1_4_1, false)
		visible(img_menu_1_5_0, false)
		visible(img_menu_1_5_1, false)
		visible(img_tps_en_wh, true)
		visible(img_vsspeed_en_wh, true)
		if autocrs == false then
			visible(img_autocrs_dis_wh, true)
			visible(img_autocrs_en_wh, false)
		else
			visible(img_autocrs_dis_wh, false)
			visible(img_autocrs_en_wh, true)
		end
		if hsi == true then
			visible(img_mode_hsi_wh, true)
			visible(img_mode_cdi_wh, false)
		else
			visible(img_mode_hsi_wh, false)
			visible(img_mode_cdi_wh, true)
		end
		visible(img_ahrs, true)
		visible(img_arrow1, false)
		visible(img_arrow2, false)
		visible(txt_knob_left, false)
		visible(txt_knob_right, false)
		visible(txt_source, false)
		visible(img_auto_crs2, false)
		visible(img_mask, true)
		visible(txt_button_left_line1, false)
		visible(txt_button_left_line2, false)
		visible(txt_button_right_line1, false)
		visible(txt_button_right_line2, false)
		visible(txt_source_left, false)
		visible(txt_source_right, false)
		visible(txt_auto, true)
		visible(txt_brt, true)
		visible(var_brt, true)
		visible(txt_manual, true)
		visible(img_reddash, false)
		visible(img_reddash_left, false)
		visible(img_reddash_right, false)
		visible(txt_genset, true)
		visible(txt_page, true)
		visible(txt_page_no, true)
	else
		button_menu = false	
		if brt_auto == true then
			txt_style(var_brt, "-fx-font-size:31px; -fx-font-family:Arial; -fx-fill: #00ff00; -fx-font-weight:bold; -fx-text-alignment:right;")
			txt_style(txt_brt, "-fx-font-size:31px; -fx-font-family:Arial; -fx-fill: #00ff00; -fx-font-weight:bold; -fx-text-alignment:left;")
			txt_style(txt_auto, "-fx-font-size:31px; -fx-font-family:Arial; -fx-fill: #00ff00; -fx-font-weight:bold; -fx-text-alignment:left;")
			txt_set(txt_auto, "AUTO")
			txt_set(txt_manual, "PUSH MANUAL")
		elseif brt_auto == false then
			txt_style(var_brt, "-fx-font-size:31px; -fx-font-family:Arial; -fx-fill: magenta; -fx-font-weight:bold; -fx-text-alignment:right;")
			txt_style(txt_brt, "-fx-font-size:31px; -fx-font-family:Arial; -fx-fill: magenta; -fx-font-weight:bold; -fx-text-alignment:left;")
			txt_style(txt_auto, "-fx-font-size:31px; -fx-font-family:Arial; -fx-fill: magenta; -fx-font-weight:bold; -fx-text-alignment:left;")
			txt_set(txt_auto, "ADJUST")
			txt_set(txt_manual, "PUSH AUTO")
		end			
		if mode_right_1_1 == 1 then
			visible(img_menu_1_1_1, true)
			visible(img_menu_1_1_0, false)
		else
			visible(img_menu_1_1_0, true)
			visible(img_menu_1_1_1, false)
		end

		if mode_right_1_2 == 1 then
			visible(img_menu_1_2_1, true)
			visible(img_menu_1_2_0, false)
		else
			visible(img_menu_1_2_0, true)
			visible(img_menu_1_2_1, false)
		end
		
		if mode_right_1_3 == 1 then
			visible(img_menu_1_3_0, true)
			visible(img_menu_1_3_1, false)
		else
			visible(img_menu_1_3_0, false)
			visible(img_menu_1_3_1, true)
		end
		
		visible(img_menu_1_4_0, true)
		
		if mode_right_1_5 == 1 then
			visible(img_menu_1_5_0, true)
			visible(img_menu_1_5_1, false)
		else
			visible(img_menu_1_5_0, false)
			visible(img_menu_1_5_1, true)
		end
		visible(img_tps_en_wh, false)
		visible(img_vsspeed_en_wh, false)
		visible(img_autocrs_dis_wh, false)
		visible(img_autocrs_en_wh, false)
		visible(img_autocrs_dis_mag, false)
		visible(img_autocrs_en_mag, false)
		visible(img_mode_hsi_wh, false)
		visible(img_mode_hsi_mag, false)
		visible(img_mode_cdi_wh, false)
		visible(img_mode_cdi_mag, false)
		visible(img_ahrs, false)
		visible(img_arrow1, true)
		visible(img_arrow2, true)
		visible(txt_knob_left, true)
		visible(txt_knob_right, true)
		visible(txt_source, true)
		if autocrs == true then
			visible(img_auto_crs2, true)
		end
		if hsi == true then
			move(img_airplane, nil, 1345, nil, nil)
		else
			move(img_airplane, nil, 1300, nil, nil)
		end			
		visible(img_mask, false)
		visible(txt_button_left_line1, true)
		visible(txt_button_left_line2, true)
		visible(txt_button_right_line1, true)
		visible(txt_button_right_line2, true)
		visible(txt_source_left, true)
		visible(txt_source_right, true)
		visible(txt_auto, false)
		visible(txt_brt, false)
		visible(var_brt, false)
		visible(txt_manual, false)
		visible(txt_genset, false)
		visible(txt_page, false)
		visible(txt_page_no, false)
		txt_set(txt_page, "SEL PAGE")
		
--autocrs display		
		if autocrs == false or mode_global ~= 2 then
			visible(img_auto_crs, false)
			visible(img_auto_crs2, false)
			txt_style(txt_course, "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill: aqua; -fx-font-weight:bold; -fx-text-alignment:right;")
			txt_style(txt_knob_left, "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill: aqua; -fx-font-weight:bold; -fx-text-alignment:center;")
		else
			visible(img_auto_crs, true)
			visible(img_auto_crs2, true)
			txt_style(txt_course, "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill: #00ff00; -fx-font-weight:bold; -fx-text-alignment:right;")
			txt_style(txt_knob_left, "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill: #00ff00; -fx-font-weight:bold; -fx-text-alignment:right;")
		
		end
		
	end
end

function power_off()
	if rev_button_flag == true then
		visible(img_screen_off, true)
		pfd_pwr_flag = false
		visible(img_power_off, false)
		downtime = 15
	end
end

function power_on()
	visible(img_start, false)
--	timer_stop(time_down)
end

function button_rev_press()
	if avionics_pwr_flag == true and pfd_pwr_flag == false then
		pfd_pwr_flag = true
		visible(img_power_off, false)
		visible(img_start, true)
		visible(img_screen_off, false)	
		timer_start(3000,nil,power_on)
--	elseif avionics_pwr_flag == false and pfd_pwr_flag == true then
	elseif pfd_pwr_flag == true then
		visible(img_power_off, true)	
		timer_pwr_off = timer_start(2000,nil,power_off)
		rev_button_flag = true
	else
		print("nothing")
	end
end

function button_rev_rel()
	rev_button_flag = false
	visible(img_power_off, false)
	timer_stop(timer_pwr_off)
end

button_add("button_rev.png" , "button_rev_press.png" , 917, 152, 70, 180, button_rev_press, button_rev_rel)
button_add("button_menu.png" , "button_menu_press.png" , 917, 622, 88, 138, button_menu_press)

if autocrs == true and mode_global == 2 then
	visible(img_auto_crs, true)
	visible(img_auto_crs2, true)
	txt_style(txt_course, "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill:  #00ff00; -fx-font-weight:bold; -fx-text-alignment:right;")
	txt_style(txt_knob_left, "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill: #00ff00; -fx-font-weight:bold; -fx-text-alignment:center;")
else
	visible(img_auto_crs, false)
	visible(img_auto_crs2, false)
	txt_style(txt_course, "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill: aqua; -fx-font-weight:bold; -fx-text-alignment:right;")
end


function button_line_left()
	if button_left_mode == 0 then
		txt_set(txt_button_left_line1, " ")
		txt_set(txt_button_left_line2, " ")
	elseif button_left_mode == 1 then
		txt_set(txt_button_left_line1, gps_nav_id)
		if gps_dme < 10 then txt_set(txt_button_left_line2, var_round(gps_dme,1) .. "nm")	
		else txt_set(txt_button_left_line2, var_round(gps_dme,0) .. "nm") end	
	elseif button_left_mode == 2 then
		txt_set(txt_button_left_line1, string.sub(nav1freq,1,3).."."..string.sub(nav1freq,4,5))
		txt_set(txt_button_left_line2, " ")
	elseif button_left_mode == 3 then
		txt_set(txt_button_left_line1, string.sub(nav2freq,1,3).."."..string.sub(nav2freq,4,5))
		txt_set(txt_button_left_line2, " ")
	end
end

function button_line_right()
	if button_right_mode == 0 then
		txt_set(txt_button_right_line1, " ")
		txt_set(txt_button_right_line2, " ")
	elseif button_right_mode == 1 then
		txt_set(txt_button_right_line1, gps_nav_id)
		if gps_dme < 10 then txt_set(txt_button_right_line2, var_round(gps_dme,1) .. "nm")	
		else txt_set(txt_button_right_line2, var_round(gps_dme,0) .. "nm") end
	elseif button_right_mode == 2 then
		txt_set(txt_button_right_line1, string.sub(nav1freq,1,3).."."..string.sub(nav1freq,4,5))
		txt_set(txt_button_right_line2, " ")
	elseif button_right_mode == 3 then
		txt_set(txt_button_right_line1, string.sub(nav2freq,1,3).."."..string.sub(nav2freq,4,5))
		txt_set(txt_button_right_line2, " ")
	end
end

function press_button_left()
	if mode_right_1_3 > 0 then
		button_left_mode = button_left_mode + 1 
		if button_left_mode == 1 then
			txt_set(txt_source_left, "GPS1")
		elseif button_left_mode == 2 then
			if ils1_freq == true then
				txt_set(txt_source_left, "ILS1")
			else txt_set(txt_source_left, "VOR1")
			end
		elseif button_left_mode == 3 then
			txt_set(txt_source_left, "VOR2")
		else
			txt_set(txt_source_left, "")
			button_left_mode = 0
		end
		button_line_left()
	end
end

function press_button_right()
	if mode_right_1_3 > 0 then
		button_right_mode = button_right_mode + 1 
		if button_right_mode == 1 then
			txt_set(txt_source_right, "GPS1")
		elseif button_right_mode == 2 then
			if ils1_freq == true then
				txt_set(txt_source_right, "ILS1")
			else txt_set(txt_source_right, "VOR1")
			end
		elseif button_right_mode == 3 then
			txt_set(txt_source_right, "VOR2")
		else
			txt_set(txt_source_right, "")
			button_right_mode = 0
		end
		button_line_right()
	end
end

button_right = button_add("knob_right.png" , "knob_right_press.png" , 590, 1511, 159, 80, press_button_right)
button_left = button_add("knob_left.png" , "knob_left_press.png" , 258, 1501, 170, 99, press_button_left)

function timer_left()
	if autocrs == true and mode_global == 2 then
		txt_style(txt_knob_left, "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill: #00ff00; -fx-font-weight:bold; -fx-text-alignment:right;")
		txt_style(txt_course, "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill: #00ff00; -fx-font-weight:bold; -fx-text-alignment:right;")
		visible(img_auto_crs2, true)
	else
		txt_style(txt_knob_left, "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill: aqua; -fx-font-weight:bold; -fx-text-alignment:center;")
		txt_style(txt_course, "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill: aqua; -fx-font-weight:bold; -fx-text-alignment:right;")
	end	
	txt_set(txt_knob_left, "CRS")
	knob_left_mode = 0
	visible(img_speedmarker_mag, false)
	visible(img_speedmarker, true)
	txt_style(txt_apspd, "-fx-font-size:30px; -fx-font-family:Arial; -fx-fill: cyan; -fx-font-weight:bold; -fx-text-alignment:right;")
end

function timer_right()
	txt_style(txt_knob_right, "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill: aqua; -fx-font-weight:bold; -fx-text-alignment:center;")
	txt_set(txt_knob_right, "HDG")
	txt_style(txt_hdg, "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill: aqua; -fx-font-weight:bold; -fx-text-alignment:right;")
	txt_style(txt_inhg, "-fx-font-size:30px; -fx-font-family:Arial; -fx-fill: aqua; -fx-font-weight:bold; -fx-text-alignment:right;")
	txt_style(txt_minimum, "-fx-font-size:42px; -fx-font-family:Arial; -fx-fill: cyan; -fx-font-weight:bold; -fx-text-alignment:center;")
	txt_style(txt_apalt, "-fx-font-size:30px; -fx-font-family:Arial; -fx-fill: cyan; -fx-font-weight:bold; -fx-text-alignment:right;")
--	txt_set(txt_apspd, "-fx-font-size:30px; -fx-font-family:Arial; -fx-fill: cyan; -fx-font-weight:bold; -fx-text-alignment:right;")
					
	visible(img_altmarker_mag, false)
	visible(img_altmarker, true)
	if mode_right_1_3 == 0 then
		visible(img_headind_arc, false)
		visible(img_headbug_arc, true)
	else
		visible(img_headind, false)
		visible(img_headbug, true)	
	end
	visible(img_menu_1_5_0, true)
	visible(img_menu_1_5_1, false)
	knob_right_mode = 0
	mode_right_1_5 = 0
	
end

-----------------------------------------------------------------------------------------------------------
-- Called when the timer fires (after the 2 seconds)
function left_sync()
   print("start long press period")
	if knob_left_mode == 1 then
		rad_sync_flag = true
	elseif knob_left_mode == 2 then
		xpl_command("sim/autopilot/airspeed_sync")
	end
end

-- Called when button is pressed
function press_dial_left()
	   -- Stop any timer that might still be running
	   timer_stop(timer_left_sync)
	
	   -- Start a timer, and let it run for 2 seconds (2000 milliseconds)
	   timer_left_sync = timer_start(700, nil, left_sync)
end

-- Called when button is released
function rel_dial_left()
	   if timer_running(timer_left_sync) then
	  -- The button was released within the 2 seconds
	  
	  -- Do something with a short press
	  print("short press")
	  		if button_menu == true then	
	  			if brt_auto == true then
	  				brt_auto = false	  		
					txt_style(var_brt, "-fx-font-size:31px; -fx-font-family:Arial; -fx-fill: magenta; -fx-font-weight:bold; -fx-text-alignment:right;")
					txt_style(txt_brt, "-fx-font-size:31px; -fx-font-family:Arial; -fx-fill: magenta; -fx-font-weight:bold; -fx-text-alignment:left;")
					txt_style(txt_auto, "-fx-font-size:31px; -fx-font-family:Arial; -fx-fill: magenta; -fx-font-weight:bold; -fx-text-alignment:left;")
					txt_set(txt_auto, "ADJUST")
					txt_set(txt_manual, "PUSH AUTO")
				elseif brt_auto == false then
					brt_auto = true
					txt_style(var_brt, "-fx-font-size:31px; -fx-font-family:Arial; -fx-fill: #00ff00; -fx-font-weight:bold; -fx-text-alignment:right;")
					txt_style(txt_brt, "-fx-font-size:31px; -fx-font-family:Arial; -fx-fill: #00ff00; -fx-font-weight:bold; -fx-text-alignment:left;")
					txt_style(txt_auto, "-fx-font-size:31px; -fx-font-family:Arial; -fx-fill: #00ff00; -fx-font-weight:bold; -fx-text-alignment:left;")
					txt_set(txt_auto, "AUTO")
					txt_set(txt_manual, "PUSH MANUAL")
					brightness = 70
					txt_set(var_brt, brightness)
					visible(img_dim_64, false)
					visible(img_dim_32, false)
					visible(img_dim_16, true)
					visible(img_dim_8, true)
					visible(img_dim_4, true)
					visible(img_dim_2, true)					
				end
				
--				timer1 = timer_start(8000, nil, timer_left)
			else

				knob_left_mode = knob_left_mode + 1
				timer_right()								--- turning off right knob
				if knob_left_mode > 2 then
					knob_left_mode = 1
				end
				if knob_left_mode == 1 and autocrs == false then
						txt_set(txt_knob_left, "CRS")
						txt_style(txt_knob_left, "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill: magenta; -fx-font-weight:bold; -fx-text-alignment:center;")
						txt_style(txt_course, "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill: magenta; -fx-font-weight:bold; -fx-text-alignment:right;")
						visible(img_speedmarker_mag, false)
						visible(img_speedmarker, true)
						txt_style(txt_apspd, "-fx-font-size:30px; -fx-font-family:Arial; -fx-fill: cyan; -fx-font-weight:bold; -fx-text-alignment:right;")
						timer1 = timer_start(8000, nil, timer_left)
				elseif knob_left_mode == 1 and autocrs == true then
					knob_left_mode = 2
					visible(img_auto_crs2, false)
					txt_style(txt_knob_left, "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill: magenta; -fx-font-weight:bold; -fx-text-alignment:center;")
					txt_style(txt_course, "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill: aqua; -fx-font-weight:bold; -fx-text-alignment:right;")
					txt_set(txt_knob_left, "IAS")
					txt_style(txt_apspd, "-fx-font-size:30px; -fx-font-family:Arial; -fx-fill: magenta; -fx-font-weight:bold; -fx-text-alignment:right;")
					visible(img_speedmarker_mag, true)
					visible(img_speedmarker, false)
					timer_stop(timer1)
					timer1 = timer_start(8000, nil, timer_left)
				else 
					txt_style(txt_knob_left, "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill: magenta; -fx-font-weight:bold; -fx-text-alignment:center;")
					txt_set(txt_knob_left, "IAS")
					txt_style(txt_course, "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill: cyan; -fx-font-weight:bold; -fx-text-alignment:right;")
					txt_style(txt_apspd, "-fx-font-size:30px; -fx-font-family:Arial; -fx-fill: magenta; -fx-font-weight:bold; -fx-text-alignment:right;")
					visible(img_speedmarker_mag, true)
					visible(img_speedmarker, false)
					timer_stop(timer1)
					timer1 = timer_start(8000, nil, timer_left)
				end  
			end		    
	   else
	  -- The timer is not running anymore.
	  -- That means that the 2 seconds must have passed
	  
	  -- Do something with a long press
	  print("long press")
	  
	   end
   -- Stop any timer that might still be running
   timer_stop(timer_left_sync)
   
end

button_add("temp.png", "temp.png", 0,0,100,100, button_pressed, button_released)
-----------------------------------------------------------------------------------------------------------
-- Called when the timer fires (after the 2 seconds)
function right_sync()
   print("start long press period")

	if knob_right_mode == 1 then
		xpl_command("sim/autopilot/heading_sync")
	elseif knob_right_mode == 2 then
		xpl_command("sim/autopilot/altitude_sync")
	elseif knob_right_mode == 3 then
		minimum = var_round(baro_alt, -1)
		txt_set(txt_minimum, minimum)
	else  --if knob_right_mode == 4 then
		xpl_command("sim/instruments/barometer_2992")
	end
end

-- Called when button is pressed
function press_dial_right()
	
   -- Stop any timer that might still be running
   timer_stop(timer_right_sync)

   -- Start a timer, and let it run for 2 seconds (2000 milliseconds)
   timer_right_sync = timer_start(700, nil, right_sync)
end

-- Called when button is released
function rel_dial_right()

   if timer_running(timer_right_sync) then
      -- The button was released within the 2 seconds
      
      -- Do something with a short press
      print("short press")     
			knob_right_mode = knob_right_mode + 1
            timer_left()

			if mode_right_1_2 == 0 then		-- Minimum not engaged
				if knob_right_mode > 2 then
					knob_right_mode = 1
				end
			else		
				if knob_right_mode > 3 then
					knob_right_mode = 1
				end
			end     
				          
		if button_menu == false then
			if knob_right_mode == 1 then
				if mode_right_1_3 == 0 then
					visible(img_headind_arc, true)
					visible(img_headbug_arc, false)
				else
					visible(img_headind, true)
					visible(img_headbug, false)
				end
			else
				if mode_right_1_3 == 0 then
					visible(img_headind_arc, false)
					visible(img_headbug_arc, true)
				else
					visible(img_headind, false)
					visible(img_headbug, true)			
				end
			end
			if knob_right_mode == 1 then
				txt_set(txt_knob_right, "HDG")
				txt_style(txt_knob_right, "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill: magenta; -fx-font-weight:bold; -fx-text-alignment:center;")
				txt_style(txt_hdg, "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill: magenta; -fx-font-weight:bold; -fx-text-alignment:right;")
				txt_style(txt_minimum, "-fx-font-size:42px; -fx-font-family:Arial; -fx-fill: cyan; -fx-font-weight:bold; -fx-text-alignment:center;")
				txt_style(txt_inhg, "-fx-font-size:30px; -fx-font-family:Arial; -fx-fill: cyan; -fx-font-weight:bold; -fx-text-alignment:right;")

				timer2 = timer_start(8000, nil, timer_right)
			elseif knob_right_mode == 2 then
				txt_set(txt_knob_right, "ALT")
				timer_stop(timer2)
				timer2 = timer_start(8000, nil, timer_right)
				txt_style(txt_apalt, "-fx-font-size:30px; -fx-font-family:Arial; -fx-fill: magenta; -fx-font-weight:bold; -fx-text-alignment:right;")				
				txt_style(txt_hdg, "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill: aqua; -fx-font-weight:bold; -fx-text-alignment:right;")
				visible(img_altmarker, false)
				visible(img_altmarker_mag, true)
			elseif knob_right_mode == 4  then
				txt_set(txt_knob_right, "BARO")
 				txt_style(txt_inhg, "-fx-font-size:30px; -fx-font-family:Arial; -fx-fill: magenta; -fx-font-weight:bold; -fx-text-alignment:right;")

				timer_stop(timer2)
				timer2 = timer_start(8000, nil, timer_right)
			elseif knob_right_mode == 3  then
				txt_set(txt_knob_right, "MIN")
				timer_stop(timer2)
				timer2 = timer_start(8000, nil, timer_right)
				txt_style(txt_minimum, "-fx-font-size:42px; -fx-font-family:Arial; -fx-fill: magenta; -fx-font-weight:bold; -fx-text-alignment:center;")
			end
		end	
  
     
   else
      -- The timer is not running anymore.
      -- That means that the 2 seconds must have passed
      
      -- Do something with a long press
      print("long press")
      
   end

   -- Stop any timer that might still be running
   timer_stop(timer_right_sync)
   
end

-----------------------------------------------------------------------------------------------------------


function dial_left(d)
	if button_menu == false then
		if mode_global == 2 and autocrs == true then
			if knob_left_mode == 2 then
				timer_stop(timer1)
				if d == -1 then
					xpl_command("sim/autopilot/airspeed_down")
				elseif d == 1 then
					xpl_command("sim/autopilot/airspeed_up")
				end
				timer1 = timer_start(8000, nil, timer_left)		
			end
		
		else
			if knob_left_mode == 0 then
				knob_left_mode = 1
				txt_set(txt_knob_left, "CRS")
				txt_style(txt_knob_left, "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill: magenta; -fx-font-weight:bold; -fx-text-alignment:center;")
				txt_style(txt_course, "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill: magenta; -fx-font-weight:bold; -fx-text-alignment:right;")
				timer1 = timer_start(8000, nil, timer_left)
			elseif knob_left_mode == 1 then
					timer_stop(timer1)
					if d == -1 then
						xpl_command("sim/radios/obs_HSI_down")
					elseif d == 1 then
						xpl_command("sim/radios/obs_HSI_up")
					end
					timer1 = timer_start(8000, nil, timer_left)	
			elseif knob_left_mode == 2 then
				timer_stop(timer1)
				if d == -1 then
					xpl_command("sim/autopilot/airspeed_down")
				elseif d == 1 then
					xpl_command("sim/autopilot/airspeed_up")
				end
				timer1 = timer_start(8000, nil, timer_left)		
			end
		end
	elseif button_menu == true then
		if brt_auto == false then
			if d == -1 and brightness > 0 then
				brightness = brightness - 1
			elseif d == 1 and brightness < 100 then
				brightness = brightness + 1
			end
		end
		txt_set(var_brt, brightness)
		darkness = 100 - brightness
		if darkness > 64 then 
			visible(img_dim_64, true)
			print("64")
			darkness = darkness - 64
		else visible(img_dim_64, false) end
		if darkness > 32 then
			visible(img_dim_32, true)
			print("32")
			darkness = darkness - 32
		else visible(img_dim_32, false) end
		if darkness > 16 then
			visible(img_dim_16, true)
			print("16")
			darkness = darkness - 16
		else visible(img_dim_16, false) end
		if darkness > 8 then
			visible(img_dim_8, true)
			print("8")
			darkness = darkness - 8
		else visible(img_dim_8, false) end
		if darkness > 4 then
			visible(img_dim_4, true)
			print("4")
			darkness = darkness - 4
		else visible(img_dim_4, false) end
		if darkness > 2 then
			visible(img_dim_2, true)
			print("2")
			darkness = darkness - 2
		else visible(img_dim_2, false) end
		
	end
end

function dial_right(d)
	timer_left()
	if button_menu == false then
		if knob_right_mode == 0 then                         -- HDG
			knob_right_mode = 1
			txt_set(txt_knob_right, "HDG")
			txt_style(txt_knob_right, "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill: magenta; -fx-font-weight:bold; -fx-text-alignment:center;")
			txt_style(txt_hdg, "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill: magenta; -fx-font-weight:bold; -fx-text-alignment:right;")
			txt_style(txt_minimum, "-fx-font-size:42px; -fx-font-family:Arial; -fx-fill: cyan; -fx-font-weight:bold; -fx-text-alignment:center;")
			timer2 = timer_start(8000, nil, timer_right)
		elseif knob_right_mode == 1 then                     -- HDG
			timer_stop(timer2)
			if d == -1 then
				xpl_command("sim/autopilot/heading_down")
			elseif d == 1 then
				xpl_command("sim/autopilot/heading_up")
			end
			timer2 = timer_start(8000, nil, timer_right)		
		elseif knob_right_mode == 2 then				-- AP-Altitude
			timer_stop(timer2)
			if d == -1 then
				xpl_command("sim/autopilot/altitude_down")
			elseif d == 1 then
				xpl_command("sim/autopilot/altitude_up")
			end
			timer2 = timer_start(8000, nil, timer_right)		
		elseif knob_right_mode == 4 then				-- QNH
			timer_stop(timer2)
			if d == -1 then
				xpl_command("sim/instruments/barometer_down")
			elseif d == 1 then
				xpl_command("sim/instruments/barometer_up")
			end
			timer2 = timer_start(8000, nil, timer_right)					
		elseif knob_right_mode == 3 then				-- Minimum
			timer_stop(timer2)
			if d == -1 then
				minimum = minimum - 10
			elseif d == 1 then
				minimum = minimum + 10
			end
			txt_set(txt_minimum, minimum)
			timer2 = timer_start(8000, nil, timer_right)					
		end
		
		if knob_right_mode == 1 then
			if mode_right_1_3 == 0 then
				visible(img_headind_arc, true)
				visible(img_headbug_arc, false)
			else
				visible(img_headind, true)
				visible(img_headbug, false)
			end
		else
			if mode_right_1_3 == 0 then
				visible(img_headind_arc, false)
				visible(img_headbug_arc, true)
			else
				visible(img_headind, false)
				visible(img_headbug, true)			
			end
		end

		
		
	elseif button_menu == true then
		if menu == 3 then
			if autocrs == true then
				autocrs = false
				visible(img_autocrs_dis_mag, true)
				visible(img_autocrs_en_mag, false)
			else
				autocrs = true
				visible(img_autocrs_dis_mag, false)
				visible(img_autocrs_en_mag, true)					
			end
		elseif menu == 4 then
			if mode_right_1_3 == 0 then
				if hsi == true then
					hsi = false
					visible(img_mode_hsi_mag, false)
					visible(img_mode_cdi_mag, true)
				else
					hsi = true
					visible(img_mode_hsi_mag, true)
					visible(img_mode_cdi_mag, false)
				end
			end
		end
	end
end

--dial_left = dial_add("Dial.png" ,117, 1577, 88, 88, dial_left)
dial_left = dial_add("knob.png" ,60, 1500, 210, 210, dial_left)
dial_click_rotate(dial_left, 2)
knob_left = button_add("Dial_test.png" , "dial_press.png" , 75, 1515, 180, 180, press_dial_left, rel_dial_left)

dial_right = dial_add("knob.png" ,745, 1500, 210, 210, dial_right)
dial_click_rotate(dial_right, 2)
knob_right = button_add("Dial_test.png" , "dial_press.png" , 760, 1515, 180, 180, press_dial_right, rel_dial_right)

-- Button to the right
function menu_right_1()
	if menu_2_2_flag == true then
		if button_menu == false then
			if mode_right_1_1 == 0 then
				mode_right_1_1 = 1
				visible(img_menu_1_1_0, false)
				visible(img_menu_1_1_1, true)
				visible(img_menu_2_2_0, true)
				visible(img_menu_2_3_0, true)
				visible(img_menu_2_4_0, true)
			else
				mode_right_1_1 = 0
				visible(img_menu_1_1_0, true)
				visible(img_menu_1_1_1, false)
				visible(img_menu_2_2_0, false)
				visible(img_menu_2_3_0, false)
				visible(img_menu_2_4_0, false)
			end
		end
	end
end
function menu_right_2()
	if button_menu == false then
		if mode_right_1_1 == 0 then
			if mode_right_1_2 == 0 then
				mode_right_1_2 = 1
				knob_right_mode = 3				-- direct jump to change Minimum
				visible(img_menu_1_2_0, false)
				visible(img_menu_1_2_1, true)
				visible(img_minimum, true)
				visible(txt_minimum, true)	
				txt_style(txt_knob_right, "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill: magenta; -fx-font-weight:bold; -fx-text-alignment:center;")
				txt_set(txt_knob_right, "MIN")
				timer_stop(timer2)
				timer2 = timer_start(8000, nil, timer_right)
				txt_style(txt_minimum, "-fx-font-size:42px; -fx-font-family:Arial; -fx-fill: magenta; -fx-font-weight:bold; -fx-text-alignment:center;")		
			else
				mode_right_1_2 = 0
				visible(img_menu_1_2_0, true)
				visible(img_menu_1_2_1, false)
				visible(img_minimum, false)
				visible(img_minimum_sel, false)
				visible(txt_minimum, false)
			end
		end
	end
end

function menu_right_5()
	if button_menu == false then
		if mode_right_1_5 == 0 then
			mode_right_1_5 = 1
			knob_right_mode = 4			-- direct jump to change Baro
			visible(img_menu_1_5_0, false)
			visible(img_menu_1_5_1, true)
			txt_style(txt_knob_right, "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill: magenta; -fx-font-weight:bold; -fx-text-alignment:center;")
			txt_style(txt_inhg, "-fx-font-size:30px; -fx-font-family:Arial; -fx-fill: magenta; -fx-font-weight:bold; -fx-text-alignment:right;")
			txt_set(txt_knob_right, "BARO")	
			timer_stop(timer2)
			timer2 = timer_start(8000, nil, timer_right)
		else
			mode_right_1_5 = 0
			visible(img_menu_1_5_0, true)
			visible(img_menu_1_5_1, false)
			txt_set(txt_knob_right, "HDG")
			txt_style(txt_knob_right, "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill: cyan; -fx-font-weight:bold; -fx-text-alignment:center;")
			txt_style(txt_inhg, "-fx-font-size:30px; -fx-font-family:Arial; -fx-fill: cyan; -fx-font-weight:bold; -fx-text-alignment:right;")
			knob_right_mode = 0
			
		end
	end
end

function menu_right_3()
	if button_menu == false then
		if mode_right_1_1 == 0 then	
			if hsi == true then
				move(img_airplane, nil, 1345, nil, nil)
			else
				move(img_airplane, nil, 1300, nil, nil)
			end
			if mode_right_1_3 == 0 then
				hsi_store = hsi
				hsi = true
				visible(img_menu_1_3_0, true)
				visible(img_menu_1_3_1, false)
				visible(img_compasrose, true)
				visible(img_compas_arc, false)
				visible(img_turnind, true)
				visible(img_turnind_arc, false)
				visible(img_comp_back, true)
				visible(img_headbug, true)
				visible(img_headbug_arc, false)
				visible(img_headind_arc, false)
				visible(img_needle, false)
				visible(img_needle_to, false)
				visible(img_needle_fr, false)
				visible(img_needle_arc1, false)
				visible(img_needle_arc2, false)
				visible(img_needle_to_arc1, false)
				visible(img_needle_to_arc2, false)			
				visible(img_needle_fr_arc1, false)
				visible(img_needle_fr_arc2, false)			
				visible(txt_raute_fr, false)
				visible(txt_raute_to, false)
				visible(txt_cdi_bc1, false)
				visible(img_cdi_raute, false)
				visible(img_cdi_raute_off, false)
				visible(img_cdi, false)
				visible(img_cdi_needle, false)	
						
				running_txt_viewport_rect(arc_inner_txt_id, 75, 862, 0, 0)
				running_txt_viewport_rect(compass_inner_txt_id, 75, 856, 700, 700)
				move(img_airplane, nil, 1075, nil, nil)	
			elseif mode_right_1_3 == 1 then
				hsi = hsi_store
				if hsi == true then
					move(img_airplane, nil, 1345, nil, nil)
				else
					move(img_airplane, nil, 1300, nil, nil)
				end
				visible(img_menu_1_3_0, false)
				visible(img_menu_1_3_1, true)
				visible(img_vsi, false)
				visible(img_compasrose, false)
				visible(img_compas_arc, true)
				visible(img_turnind, false)
				visible(img_turnind_arc, true)
				visible(img_comp_back, false)
				visible(img_headbug, false)
				visible(img_headind, false)
				visible(img_headbug_arc, true)
				visible(img_needle, false)
				visible(img_needle_to, false)
				visible(img_needle_fr, false)
				visible(img_center_needle, false)
				visible(img_center_needle_off, false)
				running_txt_viewport_rect(arc_inner_txt_id, 75, 862, 770, 250)
				running_txt_viewport_rect(compass_inner_txt_id, 75, 856, 0, 0)
			end
			mode_right_1_3 = mode_right_1_3 + 1
		end
	else
		txt_set(txt_page, "EDIT VALUE")
		if menu == 4 then
			if hsi == true then
				visible(img_mode_hsi_wh, true)
				visible(img_mode_hsi_mag, false)
			else
				visible(img_mode_cdi_wh, true)
				visible(img_mode_cdi_mag, false)
			end	
		end
		if autocrs == false then
			visible(img_autocrs_dis_mag, true)
			visible(img_autocrs_en_mag, false)
			visible(img_autocrs_dis_wh, false)
			visible(img_autocrs_en_wh, false)
		else
			visible(img_autocrs_dis_mag, false)
			visible(img_autocrs_en_mag, true)
			visible(img_autocrs_dis_wh, false)
			visible(img_autocrs_en_wh, false)
		end
		menu = 3
	end

	if mode_right_1_3 > 1 then
		mode_right_1_3 = 0
	end
end

function menu_right_4()
	if button_menu == true then
		txt_set(txt_page, "EDIT VALUE")
		if menu == 3 then
			if autocrs == true then
				visible(img_autocrs_en_mag, false)
				visible(img_autocrs_dis_wh, true)					
			else
				visible(img_autocrs_dis_mag, false)
				visible(img_autocrs_dis_wh, true)			
			end
		end
		if hsi == true then
			visible(img_mode_hsi_wh, false)
			visible(img_mode_hsi_mag, true)
			visible(img_mode_cdi_wh, false)
			visible(img_mode_cdi_mag, false)
		else
			visible(img_mode_hsi_wh, false)
			visible(img_mode_hsi_mag, false)
			visible(img_mode_cdi_wh, false)
			visible(img_mode_cdi_mag, true)
		end	
		menu = 4
	else


		if mode_right_1_4 == 0 then
			mode_right_1_4 = 1
			visible(img_menu_1_4_0, false)
			visible(img_menu_1_4_1, true)
		else
			mode_right_1_4 = 0
			visible(img_menu_1_4_0, true)
			visible(img_menu_1_4_1, false)
		end
	end
end
menu_right_1 = button_add("button_right_1.png", "button_right_1_press.png", 912, 777, 82, 100, menu_right_1)
menu_right_2 = button_add("button_right_2.png", "button_right_2_press.png", 912, 904, 80, 85, menu_right_2)
menu_right_3 = button_add("button_right_3.png", "button_right_3_press.png", 924, 1025, 65, 88, menu_right_3)
menu_right_4 = button_add("button_right_4.png", "button_right_4_press.png", 912, 1132, 91, 110, menu_right_4)
menu_right_5 = button_add("button_right_5.png", "button_right_5_press.png", 915, 1255, 77, 106, menu_right_5)

-- Running text airspeed --
function item_value_callback_inner_speed_minor(i)
    
	if i > 0 then
		return""
	else
		return string.format("%d", (0 - i) % 10 )
	end
	
end
running_text_inner_speed_minor_id = running_txt_add_ver(118,364,5,30,44, item_value_callback_inner_speed_minor, "-fx-font-size:42px; -fx-font-family:arial; -fx-font-weight:bold; -fx-fill:white;")

running_txt_move_carot(running_text_inner_speed_minor_id, 0)

running_txt_viewport_rect(running_text_inner_speed_minor_id,113,423,29,106)

function item_value_callback_inner_speed_major(i)
    
	if i == 0 then
		return ""
	else
		return string.format("%d", (0 - i) )
	end
	
end

running_text_inner_speed_major_id = running_txt_add_ver(69,408,3,50,44, item_value_callback_inner_speed_major, "-fx-font-size:42px; -fx-font-family:arial; -fx-fill:white; -fx-font-weight:bold; -fx-text-alignment:right")
running_txt_move_carot(running_text_inner_speed_major_id, 0)

running_txt_viewport_rect(running_text_inner_speed_major_id,72,450,46,52)
---------------------------

-- Running text altitude --
function item_value_callback_inner_alt_minor(i)
	
	if i == 0 then
		return"0"
	elseif i > 0 then
		return""
	else
		return string.format("%02d", ((0-i)%10) * 10 )
	end
	
end

running_text_inner_alt_minor_id = running_txt_add_ver(815,380,5,50,40, item_value_callback_inner_alt_minor, "-fx-font-size:28px; -fx-font-family:arial; -fx-fill:white; -fx-font-weight:bold; -fx-text-alignment:right")
running_txt_move_carot(running_text_inner_alt_minor_id, 0)
running_txt_viewport_rect(running_text_inner_alt_minor_id,825,425,42,106)


function item_value_callback_inner_alt_major100(i)
    
	if i == 0 then
		return""
	else
		return string.format("%d", (0 - i)%10 )
	end
	
end

running_text_inner_alt_major100_id = running_txt_add_ver(786,420,3,44,40, item_value_callback_inner_alt_major100, "-fx-font-size:28px; -fx-font-family:arial; -fx-fill:white; -fx-font-weight:bold; -fx-text-alignment:right")
running_txt_move_carot(running_text_inner_alt_major100_id, 0)
running_txt_viewport_rect(running_text_inner_alt_major100_id,770,450,60,52)

function item_value_callback_inner_alt_major1000(i)

	if i == 0 then
		return""
	else
		return"" .. - i
	end
	
end

running_text_inner_alt_major1000_id = running_txt_add_ver(754,402,3,55,50, item_value_callback_inner_alt_major1000, "-fx-font-size:44px; -fx-font-family:arial; -fx-fill:white; -fx-font-weight:bold; -fx-text-alignment:right")
running_txt_move_carot(running_text_inner_alt_major1000_id, 0)
running_txt_viewport_rect(running_text_inner_alt_major1000_id,760,450,60,52)
---------------------------
function item_value_callback_compass(i)
    t = i % 12

    if t == 0 then
        return "N"
    elseif t == 3 then
        return "W"
    elseif t == 6 then
        return "S"        
    elseif t == 9 then
        return "E"
    end
    
    value = 36 - (t*3)
    
    if value < 0 then
        value = value + 36
    end
    
    return value
end

compass_inner_txt_id = running_txt_add_cir(450,1095,12,40,40,190,item_value_callback_compass, "-fx-font-size:30px; -fx-font-family:Arial; -fx-fill:white; -fx-font-weight:bold; -fx-text-alignment:center")
arc_inner_txt_id = running_txt_add_cir(450,1351,12,40,40,450,item_value_callback_compass, "-fx-font-size:30px; -fx-font-family:Arial; -fx-fill:white; -fx-font-weight:bold; -fx-text-alignment:center")
running_txt_viewport_rect(arc_inner_txt_id, 75, 862, 770, 250)
running_txt_viewport_rect(compass_inner_txt_id, 75, 856, 0, 0)

--// VOR Needle on top of compass \\--
img_headind = img_add("headingind.png", 444, 855, 52, 506)
visible(img_headind, false)
img_headbug = img_add("headingbug.png", 444, 855, 52, 506)
visible(img_headbug, false)
img_headind_arc = img_add("headingind_arc.png", 444, 855, 52, 1012)
visible(img_headind_arc, false)
img_headbug_arc = img_add("headingbug_arc.png", 444, 855, 52, 1012)
img_cdi_needle = img_add("cdi_needle.png", 356, 879, 228, 1000)
visible(img_cdi_needle, false)
img_center_needle = img_add("hsi_center_needle.png", 460, 855, 20, 204)
img_center_needle_arc1 = img_add("hsi_center_needle_arc1.png", 460, 1200, 20, 340)
img_center_needle_arc2 = img_add("hsi_center_needle_arc2.png", 460, 1160, 20, 435)
img_center_needle_off = img_add("hsi_center_needle_off.png", 460, 855, 20, 204)
img_center_needle_off_arc1 = img_add("hsi_center_needle_off_arc1.png", 460, 1200, 20, 340)
img_center_needle_off_arc2 = img_add("hsi_center_needle_off_arc2.png", 460, 1160, 20, 435)
visible(img_center_needle, false)
visible(img_center_needle_arc1, false)
visible(img_center_needle_arc2, false)
visible(img_center_needle_off, false)
visible(img_center_needle_off_arc1, false)
visible(img_center_needle_off_arc2, false)
img_trueh = img_add("trueheading.png", 444, 855, 52, 506)
img_airplane = img_add("airplane-icon.png", 445, 1345, 50, 50)
img_needle_1 = img_add("arrow1long.png", 356, 889, 228, 440)
img_needle_2 = img_add("arrow2long.png", 356, 889, 228, 440)
img_tps_en_wh = img_add("tps_en_wh.png", 552, 845,320,41)
img_vsspeed_en_wh = img_add("vsspeeds_en_wh.png", 552, 946,320,41)
img_autocrs_dis_wh = img_add("autocrs_dis_wh.png", 552, 1061, 320, 41)
img_autocrs_en_wh = img_add("autocrs_en_wh.png", 552, 1061, 320, 41)
img_autocrs_dis_mag = img_add("autocrs_dis_mag.png", 552, 1061, 320, 41)
img_autocrs_en_mag = img_add("autocrs_en_mag.png", 552, 1061, 320, 41)
img_mode_hsi_wh = img_add("mode_hsi_wh.png", 552, 1176, 320, 41)
img_mode_hsi_mag = img_add("mode_hsi_mag.png", 552, 1176, 320, 41)
img_mode_cdi_wh = img_add("mode_cdi_wh.png", 552, 1176, 320, 41)
img_mode_cdi_mag = img_add("mode_cdi_mag.png", 552, 1176, 320, 41)
img_ahrs = img_add("ahrs_wh.png", 552, 1291, 320, 41)
img_screen_off = img_add("screen_black.png", 70, 154, 805, 1280)
img_start = img_add("start.png", 70, 154, 805, 1280)
img_dim_64 = img_add("dim_64.png", 70, 154, 805, 1280)
img_dim_32 = img_add("dim_32.png", 70, 154, 805, 1280)
img_dim_16 = img_add("dim_16.png", 70, 154, 805, 1280)
img_dim_8 = img_add("dim_8.png", 70, 154, 805, 1280)
img_dim_4 = img_add("dim_4.png", 70, 154, 805, 1280)
img_dim_2 = img_add("dim_2.png", 70, 154, 805, 1280)

visible(img_tps_en_wh, false)
visible(img_vsspeed_en_wh, false)
visible(img_autocrs_dis_wh, false)
visible(img_autocrs_en_wh, false)
visible(img_autocrs_dis_mag, false)
visible(img_autocrs_en_mag, false)
visible(img_mode_hsi_wh, false)
visible(img_mode_hsi_mag, false)
visible(img_mode_cdi_wh, false)
visible(img_mode_cdi_mag, false)
visible(img_ahrs, false)
visible(img_screen_off, false)
visible(img_start, false)
visible(img_dim_64, false)
visible(img_dim_32, false)
visible(img_dim_16, true)
visible(img_dim_8, true)
visible(img_dim_4, true)
visible(img_dim_2, true)


---------------
-- Add sound --
---------------
snd_dhwarning = sound_add("dhaudio.wav")
snd_apaltwarning = sound_add("alttone.wav")

--------------
-- Viewport --
--------------
viewport_rect(img_horizonscale, 70, 237, 800, 516)
viewport_rect(img_roll, 70, 155, 584, 120)
viewport_rect(img_spdyellow, 165, 197, 10, 511)
viewport_rect(img_spdred, 165, 197, 10, 511)
viewport_rect(img_altmarker,733,197,137,511)
viewport_rect(img_altmarker_mag,733,197,137,511)
viewport_rect(img_speedmarker,150,197,137,511)
viewport_rect(img_speedmarker_mag,150,197,137,511)
viewport_rect(img_turnleft, 372, 829, 96, 42)
viewport_rect(img_turnright, 472, 829, 96, 42)
viewport_rect(img_turnleft_arc, 262, 829, 210 ,70)
viewport_rect(img_turnright_arc, 472, 829, 210, 70)
viewport_rect(img_headind_arc, 75, 862, 771, 550)
viewport_rect(img_headbug_arc, 75, 862, 771, 550)
viewport_rect(img_cdi_needle, 75, 862, 771, 530)
viewport_rect(img_needle_arc1, 75, 862, 771, 530)
viewport_rect(img_needle_to_arc1, 75, 862, 771, 530)
viewport_rect(img_needle_fr_arc1, 75, 862, 771, 530)
viewport_rect(img_needle_arc2, 75, 862, 771, 530)
viewport_rect(img_needle_to_arc2, 75, 862, 771, 530)
viewport_rect(img_needle_fr_arc2, 75, 862, 771, 530)
viewport_rect(img_center_needle_arc1, 75, 862, 771, 530)
viewport_rect(img_center_needle_arc2, 75, 862, 771, 530)
viewport_rect(img_center_needle_off_arc1, 75, 862, 771, 530)
viewport_rect(img_center_needle_off_arc2, 75, 862, 771, 530)
viewport_rect(img_yellow_triangle, 729, 197, 32, 510)
viewport_rect(img_red_triangle, 729, 197, 32, 510)
viewport_rect(img_green_triangle, 729, 197, 32, 510)

---------------
-- Functions --
---------------

-- Altitude, speed and radar altimeter --
function new_altitude(radalt, dh, altitude, airspeed, vne, vno, altmarker, vso, vs, vfe, vspeed)
--function new_altitude(radalt, dh, altitude, airspeed, vne, vno, altmarker)
	vfe=vfe-25
	baro_alt = altitude
	if airspeed < vne then
		vne_flag = true
	end
--Vso / Vfe white Arc ---

	viewport_rect(img_spdwhite, 159, 477 - 6.6*(vfe - airspeed), 10, 6.6 * (vfe-vso))
	viewport_rect(img_spdgreen, 165, 477 - 6.6*(vno - airspeed), 10, 6.6 * (vno-vs))
	
-- VNO and VNE bar
	y_yellow = ((airspeed - vno) * 6.6) - 35
	y_yellow = var_cap(y_yellow, -314, 197)
	if vno > 0 then
		move(img_spdyellow,nil,y_yellow,nil,nil)
	else
		move(img_spdyellow,nil,-314,nil,nil)
	end

	y_red = ((airspeed - vne) * 6.6) - 35
	y_red = var_cap(y_red, -314, 197)
	if vne > 0 then
		move(img_spdred,nil,y_red,nil,nil)
	else
		move(img_spdred,nil,-314,nil,nil)
	end

-- Minimums
	if mode_right_1_2 == 1 then
		if altitude > minimum then
			visible(img_minimum, false)
			visible(img_minimum_sel, true)
		else
			visible(img_minimum, true)
			visible(img_minimum_sel, false)			
		end
		height_above_min = altitude - minimum							-- Yellow Triangle
		px_above_min = height_above_min *116 / 100
		move(img_yellow_triangle,nil,241 + px_above_min,nil,nil)
		move(img_red_triangle,nil,473 + px_above_min,nil,nil)
		move(img_green_triangle,nil, px_above_min - 150,nil,nil)
		visible(img_yellow_triangle, true)
		visible(img_red_triangle, true)
		visible(img_green_triangle, true)
	else
		visible(img_yellow_triangle, false)	
		visible(img_red_triangle, false)	
	end
		
-- Decision height indicator at 10 feet and below
	visible(img_dh, (dh > 0) and (radalt < (dh + 10)) )
	if (dh > 0) and (radalt < (dh + 10)) then
	
		if dhwarning == false then
			sound_play(snd_dhwarning)
		end
		
		dhwarning = true
	else
		dhwarning = false
	end
		
-- Speed indicator running image
	airspeed = var_cap(airspeed, 0, 999)

	running_txt_move_carot(running_text_speed, (airspeed / 10) * -1)
    running_img_move_carot(running_img_speed, (airspeed / 10) * -1)
	
	yspeed = 300 + (airspeed * 6.6)
	yspeed = var_cap(yspeed, 300, 511)
	
	running_txt_viewport_rect(running_text_speed,70,197,95,yspeed)
	running_img_viewport_rect(running_img_speed,142,197,34,yspeed)
	
-- Speed indicator running text
    running_txt_move_carot(running_text_inner_speed_minor_id, (airspeed / 1) * -1)

    if airspeed % 10 > 9 then
	   	running_txt_move_carot(running_text_inner_speed_major_id, ( airspeed - 9 - (math.floor(airspeed / 10) * 9) ) * -1 )
    else
    	running_txt_move_carot(running_text_inner_speed_major_id, math.floor(airspeed / 10) * -1)
    end

-- Altitude indicator running image
	altitude = var_cap(altitude, 0, 40000)

	running_txt_move_carot(running_text_alt, (altitude / 100) * -1)
    running_img_move_carot(running_img_alt, (altitude / 100) * -1)
	
	yalt = 300 + (altitude * 1.16)
	yalt = var_cap(yalt, 300, 511)
	
	running_txt_viewport_rect(running_text_alt,733,197,137,yalt)
	running_img_viewport_rect(running_img_alt,733,197,137,yalt)
	
-- Altitude indicator running text
	running_txt_move_carot(running_text_inner_alt_minor_id, (altitude / 10) * -1)
	
	if altitude % 100 > 90 then
    	running_txt_move_carot(running_text_inner_alt_major100_id, ( altitude - 90 - (math.floor(altitude / 100) * 90) ) * -0.1 )
    else
    	running_txt_move_carot(running_text_inner_alt_major100_id, math.floor(altitude / 100) * -1)
    end
	
	if (altitude % 1000) > 990 then
    	running_txt_move_carot(running_text_inner_alt_major1000_id, (( altitude - 990 - (math.floor(altitude / 1000) * 990) ) * -0.1))
    else
    	running_txt_move_carot(running_text_inner_alt_major1000_id, math.floor( altitude / 1000 ) * -1)
    end

-- Autopilot altitude marker and warning

	y_altmarker = ((altmarker - altitude) * -1.16) + 451
	y_altmarker = var_cap(y_altmarker, 147, 708)
	if altmarker > 0 then
		move(img_altmarker,nil,y_altmarker,nil,nil)
		move(img_altmarker_mag,nil,y_altmarker,nil,nil)
	else
		move(img_altmarker,nil,147,nil,nil)
		move(img_altmarker_mag,nil,147,nil,nil)
	end
	
--	if math.abs(altmarker - altitude) > 20 then
--		if ((altmarker - altitude <= vspeed/4) and (vspeed > 0)) and (altitude < altmarker) then
--			alt_flag = true
--	
--		elseif ((altitude - altmarker <= vspeed/4*-1) and (vspeed < 0)) and (altitude > altmarker) then
--			alt_flag = true
--		else
--			alt_flag = false
--		end
--	else
--		alt_flag = false
--	end
	if altmarker > 0 then
		if math.abs(altmarker - altitude) < 20 then
			alt_flag2 = false
			visible(img_apaltbox, false)
		elseif (math.abs(altmarker - altitude) <= 200 and alt_flag == false and alt_flag2 == true) then
			alt_flag = true
			visible(img_apaltbox, true)
		elseif (math.abs(altmarker - altitude) <= 200 and alt_flag == true and alt_flag2 == false) then
			visible(img_apaltbox, false)
		elseif (math.abs(altmarker - altitude) > 200 and alt_flag == false) then
			visible(img_apaltbox, false)
		elseif (math.abs(altmarker - altitude) > 200 and alt_flag == true) then
			visible(img_apaltbox, true)
		end
	else
		visible(img_apaltbox, false)
		alt_flag = false
		alt_flag2 = true
	end
	
	
	if (altmarker > 0) and (altmarker - altitude <= 200) and (altmarker - altitude >= -200) then
		
			if altwarning == false then
				sound_play(snd_apaltwarning)
			end
			
			altwarning = true
		else
			altwarning = false
		end
end

-- Attitude indicator --
function new_attitude(roll, pitch, slip)    

-- Roll outer ring
	rollind = var_cap(roll, -60, 60)
    img_rotate(img_roll, rollind *-1)
        
-- Roll horizon
    img_rotate(img_horizon, roll * -1)
	img_rotate(img_horizonscale, roll * -1)
    
-- Move horizon pitch
    pitch = var_cap(pitch,-55,55)
    radial = math.rad(roll * -1)
    x = -(math.sin(radial) * pitch * 12.7)
    y = (math.cos(radial) * pitch * 12.7)
    img_move(img_horizon, x - 280, y - 1024, nil, nil)
	img_move(img_horizonscale, x - 280, y - 1024, nil, nil)
    
-- Move slip ball
	slip = var_cap(slip * 2,-30,30)
    img_move(img_slip, 455 - slip, nil, nil, nil)
	
end

-- Information bar top --
function new_infobartop(apspeed, apalt, airspeed)

-- Autopilot airspeed setting
	if apspeed > 0 then
		txt_set(txt_apspd, apspeed .. " kt")
	else
		txt_set(txt_apspd, " ")
	end
	
-- Autopilot altitude setting
	if apalt > 0 then
		txt_set(txt_apalt, apalt)
	else
		txt_set(txt_apalt, " ")
	end

-- Autopilot airspeed bug
	img_rotate(img_speedmarker, 180)
	img_rotate(img_speedmarker_mag, 180)
	y_speedmarker = ((apspeed - airspeed) * -6.6) + 451
	y_speedmarker = var_cap(y_speedmarker, 147, 708)
	if apspeed > 0 then
		move(img_speedmarker,nil,y_speedmarker,nil,nil)
		move(img_speedmarker_mag,nil,y_speedmarker,nil,nil)
	else
		move(img_speedmarker,nil,147,nil,nil)
		move(img_speedmarker_mag,nil,147,nil,nil)
	end
end

-- Autopilot flight director --
function new_flight_director(state, pitch, roll)

-- Flight director visible
	visible(img_flightdirector, state == 1)

-- Flight director pitch and roll
	img_rotate(img_flightdirector, roll)

	pitch = var_cap(pitch,-35,35)
	radial = math.rad(roll * -1)
	x = -(math.sin(radial) * pitch * 12.7)
	y = (math.cos(radial) * pitch * 12.7)
	img_move(img_flightdirector, (x * -1) + 292, (y * -1) + 476, nil, nil)
	
end

-- Information bar center --
function new_infobarcenter(tas, gs, oat, winddir, windspd, heading, inhg)
-- True airspeed and ground speed
	txt_set(txt_tas, var_round(tas * 1.94384449, 0) .. " kt")
	txt_set(txt_gs, var_round(gs * 1.94384449, 0) .. " kt")
	
-- Outside air temperature
	txt_set(txt_oat, var_round(oat, 0) .. "\°c")
	
	txt_set(txt_wind, var_round(winddir, 0) .. "\°/" .. var_round(windspd * 1.9438449, 0) .. " kt")
	img_rotate(img_windarrow, (winddir + 180) - heading)
	
-- Barometric setting
--	txt_set(txt_inhg, var_format(inhg, 2) .. " in")
	hpa = inhg * 25.4 * 1.33322
	txt_set(txt_inhg, var_round(hpa, 0) .. " mB	")
	
-- Driftindicator (TrueHeading)
	if gs < 2 then visible(img_trueh, false)
	else visible(img_trueh, true) end
end

-- Heading and turnrate indicator --
function new_heading(elecheading, turnrate, nav1bear, nav2bear, gpsbear, gpsdme)
	gps_bear = gpsbear
	gps_dme = gpsdme
	nav1_bear = nav1bear
	nav2_bear = nav2bear
-- Back Course (BC) determination
	if ils1_freq == true then
		if math.abs(elecheading-course) < 270 and math.abs(elecheading-course) > 90 then
			bc_flag = true
		else
			bc_flag = false
		end
	end	

-- Rotate compass/arc
	img_rotate(img_compasrose, elecheading * -1)
	img_rotate(img_compas_arc, elecheading * -1)
	viewport_rect(img_compas_arc, 75, 856, 770, 400)
	txt_set(txt_compheading, string.format("%03d" .. "\°", elecheading) )
	running_txt_move_carot(compass_inner_txt_id, (elecheading / 30) + 6)
	running_txt_move_carot(arc_inner_txt_id, (elecheading / 30) + 6)
-- Show and Rotate Needle1
	if mode_right_1_3 == 1 then  -- 360grad Mode
		if button_left_mode == 1 then
			visible(img_needle_1, true)
			img_rotate(img_needle_1, -elecheading+gps_bear)
			visible(img_reddash_left, false)
		elseif button_left_mode == 2  and nav1flag == true then
			if ils1_freq == false then
				visible(img_needle_1, true)
			else visible(img_needle_1, false)
			end
			img_rotate(img_needle_1, -elecheading+nav1bear)
			visible(img_reddash_left, false)
		elseif button_left_mode == 3  and nav2flag == true then
			visible(img_needle_1, true)
			visible(img_reddash_left, false)
			img_rotate(img_needle_1, -elecheading+nav2bear)
		elseif button_left_mode == 0 then
			visible(img_needle_1, false)
			visible(img_reddash_left, false)	
		else 
			visible(img_needle_1, false)
			if button_menu == false then
				visible(img_reddash_left, true)
			else
				visible(img_reddash_left, false)
			end
		end
-- Show and Rotate Needle2
		if button_right_mode == 1 then
			visible(img_needle_2, true)
			img_rotate(img_needle_2, -elecheading+gps_bear)
			visible(img_reddash_right, false)
		elseif button_right_mode == 2  and nav1flag == true then
			if ils1_freq == false then
				visible(img_needle_2, true)
			else visible(img_needle_2, false)
			end
			img_rotate(img_needle_2, -elecheading+nav1bear)
			visible(img_reddash_right, false)
		elseif button_right_mode == 3  and nav2flag == true then
			visible(img_needle_2, true)
			visible(img_reddash_right, false)
			img_rotate(img_needle_2, -elecheading+nav2bear)
		elseif button_right_mode == 0 then
			visible(img_needle_2, false)
			visible(img_reddash_right, false)	
		else 
			visible(img_needle_2, false)
			if button_menu == false then
				visible(img_reddash_right, true)
			else
				visible(img_reddash_right, false)
			end
		end
	else -- ARC_Mode
		visible(img_needle_1, false)
		visible(img_needle_2, false)
		visible(img_reddash_left, false)
		visible(img_reddash_right, false)
	end
-- Turn indicator
	
	turnrate = var_cap(turnrate, -20, 20)
	if turnrate > 0 then
		img_rotate(img_turnright, turnrate - 10)
		img_rotate(img_turnright_arc, turnrate - 10)
	else
		img_rotate(img_turnright, -10)
		img_rotate(img_turnright_arc, -10)
	end
	
	if turnrate < 0 then
		img_rotate(img_turnleft, turnrate + 10)
		img_rotate(img_turnleft_arc, turnrate + 10)
	else
		img_rotate(img_turnleft, 10)
		img_rotate(img_turnleft_arc, 10)
	end
	if mode_right_1_3 == 1 then  -- 360grad Mode
		visible(img_turnleft, true)						
		visible(img_turnright, true)					
		visible(img_turnleft_arc, false)						
		visible(img_turnright_arc, false)					
	else
		visible(img_turnleft, false)						
		visible(img_turnright, false)					
		visible(img_turnleft_arc, true)						
		visible(img_turnright_arc, true)					
	end
end

-- Vertical speed indicator and altitude trend vector --
function new_vsi(vs)
	if vs >= 0 then
			viewport_rect(img_vsi_trend, 720, 474-(vs/8.7), 34, (vs/8.7))
	elseif vs < 0 then
			viewport_rect(img_vsi_trend, 720, 474, 34, (math.abs(vs)/8.7))
	end
	if vs <= 600 and vs >= -600 then
		vsi = var_round(vs / 10, 0) * 10
	elseif vs > 600 or vs < -600 then
		vsi = var_round(vs / 100, 0) * 100
	end
	if vs >= 10 then
		if mode_right_1_3 == 0 then
			visible(img_vsi, false)
			visible(img_vsi_scale, false)
		else
			visible(img_vsi, true)			
			visible(img_vsi_scale, true)
		end
		txt_set(txt_vsi, "+" .. vsi)
		viewport_rect(img_vsi, 780, 860, 50, 254)		
		if vs <= 1000 then	
			viewport_rect(img_vsi_scale, 780, 1113-(vs/6.25), 50, (vs/6.25)-1 )
		elseif vs <= 2000 then		
			viewport_rect(img_vsi_scale, 780, 953-((vs-1000)/12.5), 50, 160+((vs-1000)/12.5) )
		else 
			viewport_rect(img_vsi_scale, 780, 860, 50, 254)
		end
	elseif vs <= -10 then
		if mode_right_1_3 == 0 then
			visible(img_vsi, false)
			visible(img_vsi_scale, false)
		else
			visible(img_vsi, true)			
			visible(img_vsi_scale, true)
		end
		txt_set(txt_vsi, vsi)
		viewport_rect(img_vsi, 780, 1112, 50, 254)
		if vs >= -1000 then	
			viewport_rect(img_vsi_scale, 780, 1112, 50, (vs/6.25*(-1))-1 )
		elseif vs >= -2000 then		
			viewport_rect(img_vsi_scale, 780, 1112, 50, 160+((vs+1000)/12.5*(-1)) )
		else 
			viewport_rect(img_vsi_scale, 780, 1112, 50, 254)
		end
	else
		txt_set(txt_vsi, "0")
		visible(img_vsi, false)
		visible(img_vsi_scale, false)
	end
	
end

-- Direction indicator (Credits go to macnfly for this code)
function new_HSI(heading, mode, crs, nav1hdef, nav2hdef, gpshdef, nav1vdef, nav2vdef, gpsvdef, nav1display, nav2display, apheading, elecheading, groundtrack, fr_to1, fr_to2, nav1_flag_gs, nav2_flag_gs, gps_time)
	gps_dme_time = gps_time
	course = crs
	if rad_sync_flag == true then
		if mode == 0 then
			if ils1_freq == true then
				crs = elecheading
			else
				crs = nav1_bear
			end
		elseif mode == 1 then
			if ils2_freq == true then
				crs = elecheading
			else
				crs = nav1_bear
			end		
		elseif mode == 2 then
			crs = gpsbear
		end
		xpl_dataref_write("sim/cockpit2/radios/actuators/hsi_obs_deg_mag_pilot", "FLOAT", crs)
		rad_sync_flag = false
	end
	if mode ~= mode_old then
		if mode == 2 then
			autocrs = true
			crs = gps_bear
			xpl_dataref_write("sim/cockpit2/radios/actuators/hsi_obs_deg_mag_pilot", "FLOAT", crs)
			visible(img_auto_crs, true)
			visible(img_auto_crs2, true)
			txt_style(txt_course, "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill:  #00ff00; -fx-font-weight:bold; -fx-text-alignment:right;")
			txt_style(txt_knob_left, "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill: #00ff00; -fx-font-weight:bold; -fx-text-alignment:right;")
		else
			visible(img_auto_crs, false)
			visible(img_auto_crs2, false)
			txt_style(txt_course, "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill: aqua; -fx-font-weight:bold; -fx-text-alignment:right;")
			txt_style(txt_knob_left, "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill: aqua; -fx-font-weight:bold; -fx-text-alignment:center;")
		end
	end	
	mode_old = mode 

	mode_global = mode
	if gps_dme > 999 then
		gps_dme = 999
	end

	button_line_left()
	button_line_right()
	
	if crs-heading < 0 then
		diff = 360 + (crs - heading)
	else
		diff = crs - heading
	end
	
	if fr_to1 > 0 then
		nav1flag = true
	else
		nav1flag = false
	end
	
	if fr_to2 > 0 then
		nav2flag = true
	else
		nav2flag = false
	end
		
    img_rotate(img_rose, -heading)
    
	nav1hdef = var_cap(nav1hdef, -2.5, 2.5)
	nav1vdef = var_cap(nav1vdef, -2.5, 2.5)
    if mode == 0 then 
        dh = nav1hdef*54 * math.cos((-heading+crs)*math.pi/180)
        dv = nav1hdef*54 * math.sin((-heading+crs)*math.pi/180)
        dm = nav1vdef*54
        devh = nav1hdef
    end
    
	nav2hdef = var_cap(nav2hdef, -2.5, 2.5)
	nav2vdef = var_cap(nav2vdef, -2, 2)
    if mode == 1 then 
        dh = nav2hdef*54 * math.cos((-heading+crs)*math.pi/180)
        dv = nav2hdef*54 * math.sin((-heading+crs)*math.pi/180)
        dm = nav2vdef*54
        devh = nav2hdef
    end
    
    gpshdef =12* math.sin((gps_bear - crs)*math.pi/180)
    gpshdef = var_cap(gpshdef, -2.5, 2.5)   
	gpsvdef = var_cap(gpsvdef, -2, 2)

    if mode == 2 then 
        dh = gpshdef*54 * math.cos((-heading+crs)*math.pi/180)
        dv = gpshdef*54 * math.sin((-heading+crs)*math.pi/180)
		dm = gpsvdef*54
        devh = gpshdef
    end
--    img_rotate(img_center, -heading+crs)
--  	HSI NAV 1 selected
	if mode == 0 then
		visible(img_gps1, false)
		if ils1_freq == false then
			visible(img_nav1, true)
			visible(img_ils1, false)
		else
			visible(img_nav1, false)
			visible(img_ils1, true)
		end
		visible(img_nav2, false)
		txt_set(txt_nav_line1, string.sub(nav1freq,1,3).."."..string.sub(nav1freq,4,5))
		txt_set(txt_nav_line2,"")		
		txt_set(txt_nav_line3,"")		
	elseif mode == 1 then
		visible(img_gps1, false)
		visible(img_nav1, false)
		visible(img_ils1, false)
		visible(img_nav2, true)
		txt_set(txt_nav_line1, string.sub(nav2freq,1,3).."."..string.sub(nav2freq,4,5))
		txt_set(txt_nav_line2,"")		
		txt_set(txt_nav_line3,"")		
	else
		visible(img_gps1, true)
		visible(img_nav1, false)
		visible(img_ils1, false)
		visible(img_nav2, false)
		txt_set(txt_nav_line1, gps_nav_id)
		if gps_dme < 100 then
			txt_set(txt_nav_line2, string.format("%03d" .. "\°/",gps_bear) .. var_round(gps_dme, 1))
		else txt_set(txt_nav_line2, string.format("%03d" .. "\°/",gps_bear) .. var_round(gps_dme, 0))
		end
		min, sec = 	math.modf(gps_time)
		sec = math.abs(sec * 60)
		txt_set(txt_nav_line3, string.format("%02d" .. "\:", min) .. string.format("%02d", sec))		

	end
	img_rotate(img_needle, -heading+crs)
	img_rotate(img_needle_to, -heading+crs)
	img_rotate(img_needle_fr, -heading+crs)
	img_rotate(img_needle_arc1, -heading+crs)
	img_rotate(img_needle_arc2, -heading+crs)
	img_rotate(img_needle_to_arc1, -heading+crs)
	img_rotate(img_needle_to_arc2, -heading+crs)
	img_rotate(img_needle_fr_arc1, -heading+crs)
	img_rotate(img_needle_fr_arc2, -heading+crs)
	img_rotate(img_cdi_needle, -heading+crs)

	if mode == 0 then
		fr_to = fr_to1
	elseif mode == 1 then
		fr_to = fr_to2
	elseif mode == 2 then
		if crs-gps_bear > 90 or crs-gps_bear < -90 then
			fr_to = 2
		else
			fr_to = 1
		end
	end
	if hsi == false and mode_right_1_3 == 0 then
		if fr_to == 1 then
			visible(txt_raute_fr, false)
			if bc_flag == false then
				if ils1_freq == true then
					visible(txt_raute_to, false)
				else
					visible(txt_raute_to, true)
				end
				visible(txt_cdi_bc1, false)
				img_visible(img_bc1_eadi, false)
			else
				visible(txt_raute_to, false)
				visible(txt_cdi_bc1, true)
			end
		elseif fr_to == 2 then
			visible(txt_raute_fr, true)
			visible(txt_raute_to, false)
		end	
	end	
	
		if fr_to == 1 then
			visible(img_needle, false)				
			visible(img_needle_fr, false)				
			visible(img_needle_arc1, false)
			visible(img_needle_arc2, false)
			visible(img_needle_fr_arc1, false)
			visible(img_needle_fr_arc2, false)
			visible(img_reddash, false)
			
			if hsi == true then
				visible(img_cdi_raute, false)
				visible(img_cdi_raute_off, false)
				visible(img_cdi, false)	
				if mode_right_1_3 == 0 then
					visible(img_needle_to, false)				
					if (diff > 50 and diff < 126) or (diff > 230 and diff < 306) then
						visible(img_needle_to_arc1, true)
						visible(img_needle_to_arc2, false)
					else
						visible(img_needle_to_arc1, false)
						visible(img_needle_to_arc2, true)
					end
				else
					visible(img_needle_to, true)
					visible(img_needle_to_arc1, false)
					visible(img_needle_to_arc2, false)
				end	
			else
				if devh > 2.49 or devh < -2.49 then
					visible(img_cdi_raute, false)
					visible(img_cdi_raute_off, true)
				else
					visible(img_cdi_raute, true)
					visible(img_cdi_raute_off, false)	
				end
				visible(img_cdi,true)
				move(img_airplane, nil, 1300, nil, nil)
				visible(img_cdi_needle, true)
				visible(img_needle_to_arc1, false)
				visible(img_needle_to_arc2, false)
				visible(img_needle_fr_arc1, false)
				visible(img_needle_fr_arc2, false)
				visible(img_needle_arc1, false)
				visible(img_needle_arc2, false)		
			end
		
		elseif fr_to == 2 then
			visible(img_needle, false)
			visible(img_needle_to, false)
			visible(img_needle_arc1, false)
			visible(img_needle_arc2, false)
			visible(img_needle_to_arc1, false)
			visible(img_needle_to_arc2, false)
			visible(img_reddash, false)
			
			if hsi == true then
				visible(img_cdi_raute, false)
				visible(img_cdi_raute_off, false)
				visible(img_cdi, false)	
				if mode_right_1_3 == 0 then
					visible(img_needle_fr, false)	
					if (diff > 50 and diff < 126) or (diff > 230 and diff < 306) then
						visible(img_needle_fr_arc1, true)
						visible(img_needle_fr_arc2, false)
					else
						visible(img_needle_fr_arc1, false)
						visible(img_needle_fr_arc2, true)
					end
				else
					visible(img_needle_fr, true)
					visible(img_needle_fr_arc1, false)
					visible(img_needle_fr_arc2, false)
				end
			elseif hsi == false and mode_right_1_3 == 0 then			
				if devh > 2.49 or devh < -2.49 then
					visible(img_cdi_raute, false)
					visible(img_cdi_raute_off, true)
				else
					visible(img_cdi_raute, true)
					visible(img_cdi_raute_off, false)	
				end	
				visible(img_cdi,true)
				move(img_airplane, nil, 1300, nil, nil)
				visible(img_cdi_needle, true)
				visible(img_needle_to_arc1, false)
				visible(img_needle_to_arc2, false)
				visible(img_needle_fr_arc1, false)
				visible(img_needle_fr_arc2, false)
				visible(img_needle_arc1, false)
				visible(img_needle_arc2, false)				
			end
		else
			visible(img_needle_to, false)
			visible(img_needle_fr, false)
			visible(img_needle_to_arc1, false)
			visible(img_needle_to_arc2, false)
			visible(img_needle_fr_arc1, false)
			visible(img_needle_fr_arc2, false)
			if button_menu == false then
				visible(img_reddash, true)
			else
				visible(img_reddash, false)
			end
			if hsi == true then
				visible(img_cdi_raute, false)
				visible(img_cdi_raute_off, false)
				visible(img_cdi, false)
				if mode_right_1_3 == 0 then
					visible(img_needle, false)
					if (diff > 50 and diff < 126) or (diff > 230 and diff < 306) then
						visible(img_needle_arc1, true)
						visible(img_needle_arc2, false)
					else
						visible(img_needle_arc1, false)
						visible(img_needle_arc2, true)
					end
				else
					visible(img_needle, true)
					visible(img_needle_arc1, false)
					visible(img_needle_arc2, false)
				end
			else
				visible(img_cdi_raute, true)
				visible(img_cdi_raute_off, true)
				visible(img_cdi,true)
				move(img_airplane, nil, 1300, nil, nil)
				visible(img_cdi_needle, true)
				visible(img_needle_to_arc1, false)
				visible(img_needle_to_arc2, false)
				visible(img_needle_fr_arc1, false)
				visible(img_needle_fr_arc2, false)
				visible(img_needle_arc1, false)
				visible(img_needle_arc2, false)
			end
		end
	--// Course text \\--
	txt_set(txt_course, string.format("%03d" .. "\°", crs) )
    img_rotate(img_center_needle, -heading+crs)
    img_rotate(img_center_needle_arc1, -heading+crs)
    img_rotate(img_center_needle_arc2, -heading+crs)
    img_move(img_center_needle, dh + 460, dv + 1007, nil, nil)
    img_move(img_center_needle_arc1, dh + 460, dv + 1197, nil, nil)
    img_move(img_center_needle_arc2, dh + 460, dv + 1163, nil, nil)
    img_rotate(img_center_needle_off, -heading+crs)
    img_rotate(img_center_needle_off_arc1, -heading+crs)
    img_rotate(img_center_needle_off_arc2, -heading+crs)
    img_move(img_center_needle_off, dh + 460, dv + 1007, nil, nil)
    img_move(img_center_needle_off_arc1, dh + 460, dv + 1197, nil, nil)
    img_move(img_center_needle_off_arc2, dh + 460, dv + 1163, nil, nil)
    img_move(img_raute_vert, nil, nav1vdef * 44 +462, nil, nil)
    img_move(img_raute_vert_off, nil, nav1vdef * 44 +462, nil, nil)
	if bc_flag == false then
	    img_move(img_cdi_raute, devh * 44 + 456, nil, nil, nil)
	    img_move(img_cdi_raute_off, devh * 44 + 456, nil, nil, nil)
	    img_move(img_raute_hor, devh * 44 + 455, nil, nil, nil)
	    img_move(img_raute_hor_off, devh * 44 + 455, nil, nil, nil)
	else
	    img_move(img_cdi_raute, devh * -44 + 456, nil, nil, nil)
	    img_move(img_cdi_raute_off, devh * -44 + 456, nil, nil, nil)
	    img_move(img_raute_hor, devh * -44 + 455, nil, nil, nil)
	    img_move(img_raute_hor_off, devh * -44 + 455, nil, nil, nil)
	end	
	if hsi == true then
   		if fr_to > 0 then
   	 		if mode_right_1_3 == 0 then
    			visible(img_center_needle, false)
    			visible(img_center_needle_off, false)
	    		if devh > 2.49 or devh < -2.49 then
			       	img_visible(img_center_needle_arc1, false)
	    	    	img_visible(img_center_needle_arc2, false)   		
					if (diff > 50 and diff < 126) or (diff > 230 and diff < 306) then
			        	img_visible(img_center_needle_off_arc1, true)
			        	img_visible(img_center_needle_off_arc2, false)
			        else
			        	img_visible(img_center_needle_off_arc1, false)
			        	img_visible(img_center_needle_off_arc2, true)
			        end
			    else
			       	img_visible(img_center_needle_off_arc1, false)
	    	    	img_visible(img_center_needle_off_arc2, false)   		
					if (diff > 50 and diff < 126) or (diff > 230 and diff < 306) then
			        	img_visible(img_center_needle_arc2, false)
			        	img_visible(img_center_needle_arc1, true)
			        else
			        	img_visible(img_center_needle_arc1, false)
			        	img_visible(img_center_needle_arc2, true)
			        end
			    end
			else
    			visible(img_center_needle_arc1, false)
    			visible(img_center_needle_off_arc1, false)
    			visible(img_center_needle_arc2, false)
    			visible(img_center_needle_off_arc2, false)
	    		if devh > 2.49 or devh < -2.49 then
			        img_visible(img_center_needle_off, true)
			        img_visible(img_center_needle, false)
			    else
			        img_visible(img_center_needle_off, false)
			        img_visible(img_center_needle, true)
			    end
			end
		else
		       img_visible(img_center_needle, false)
	    	   img_visible(img_center_needle_off, false)
	    end   
	else
		visible(img_center_needle_arc1, false)
    	visible(img_center_needle_off_arc1, false)
    	visible(img_center_needle_arc2, false)
    	visible(img_center_needle_off_arc2, false)
	end	
	  
-- // Approach-Indication on EADI  \\--
	if ils1_freq == true and mode == 0 then
		if nav1_flag_gs == 1 then
			img_visible(img_ils1_eadi, false)
			if bc_flag == false then
				img_visible(img_loc1_eadi, true)
				img_visible(img_bc1_eadi, false)
			else
				img_visible(img_loc1_eadi, false)
				img_visible(img_bc1_eadi, true)
			end
			img_visible(img_raute_vert, false)
	    	img_visible(img_raute_vert_off, false)
		elseif nav1_flag_gs == 0 then
			if bc_flag == false then
				img_visible(img_ils1_eadi, true)
				img_visible(img_bc1_eadi, false)
				if nav1vdef > 2.49 or nav1vdef < -2.49 then
					img_visible(img_raute_vert, false)
				    img_visible(img_raute_vert_off, true)
				else
				    img_visible(img_raute_vert, true)
				    img_visible(img_raute_vertr_off, false)
				end			
			else
				img_visible(img_raute_vert, false)
	    		img_visible(img_raute_vert_off, false)		
				img_visible(img_ils1_eadi, false)
				img_visible(img_bc1_eadi, true)
			end
			img_visible(img_loc1_eadi, false)			
		end
		img_visible(img_hor_scale, true)
		if bc_flag == true then
			img_visible(img_vert_scale, false)
		else	
			img_visible(img_vert_scale, true)
		end
		if devh > 2.49 or devh < -2.49 then
			img_visible(img_raute_hor, false)
		    img_visible(img_raute_hor_off, true)
		else
		    img_visible(img_raute_hor, true)
		    img_visible(img_raute_hor_off, false)
		end
	else
		img_visible(img_ils1_eadi, false)
		img_visible(img_hor_scale, false)
		img_visible(img_vert_scale, false)
		img_visible(img_raute_hor, false)
	    img_visible(img_raute_hor_off, false)
	    img_visible(img_raute_vert, false)
	    img_visible(img_raute_vert_off, false)	
	end
	--// Off-Flag \\--
	if ils1_freq == true then
		if fr_to1 == 0 then
			img_visible(img_reddash_eadi, true)
			img_visible(img_raute_hor, false)
		    img_visible(img_raute_hor_off, false)
		    img_visible(img_raute_vert, false)
		    img_visible(img_raute_vertr_off, false)
		else
			img_visible(img_reddash_eadi, false)
		end
		if nav1_flag_gs == 1 and nav1_flag == 1 then
			img_visible(img_loc1_eadi, true)
			img_visible(img_ils1_eadi, false)
		end
	else
		img_visible(img_reddash_eadi, false)		
	end
	--// Heading text, AP heading dialled in and true heading, etc...\\--
	txt_set(txt_hdg, string.format("%03d" .. "\°", apheading) )
	img_rotate(img_headind, (elecheading - apheading) * -1)
	img_rotate(img_headbug, (elecheading - apheading) * -1)
	img_rotate(img_headind_arc, (elecheading - apheading) * -1)
	img_rotate(img_headbug_arc, (elecheading - apheading) * -1)
	img_rotate(img_trueh, groundtrack -  elecheading)
	if mode == 0 then
		txt_set(txt_source, "VLOC1")
	elseif mode == 1 then
		txt_set(txt_source, "VOR2")
	elseif mode == 2 then
		txt_set(txt_source, "GPS1")
	else
		txt_set(txt_source, " ")
	end
	
end
-----------------------------------------------------------------------------------------------
--// NAV Setup \\--
-----------------------------------------------------------------------------------------------
function NAV_setup(nav1_freq, nav2_freq, gps_id)
	nav1freq = nav1_freq
	nav2freq = nav2_freq
	gps_nav_id = gps_id
	if nav1freq < 11200 then
		if string.sub(nav1freq,4,4) == "1" or string.sub(nav1freq,4,4) == "3" or string.sub(nav1freq,4,4) == "5" or string.sub(nav1freq,4,4) == "7" or string.sub(nav1freq,4,4) == "9" then
			ils1_freq = true
		else ils1_freq = false
		end
	else
		ils1_freq = false
		bc_flag = false
		visible(img_bc1_eadi, false)
	end
	if nav2freq < 11200 then
		if string.sub(nav2freq,4,4) == "1" or string.sub(nav2freq,4,4) == "3" or string.sub(nav2freq,4,4) == "5" or string.sub(nav2freq,4,4) == "7" or string.sub(nav2freq,4,4) == "9" then
			ils2_freq = true
		else ils2_freq = false
		end
	else ils2_freq = false
	end
end

--------------
-- Electric --
--------------

function time_down()
--	if avionics_pwr_flag == true then
--		downtime = 16
--	end
	downtime = downtime - 1
	if downtime < 10 then
		txt_set(txt_timer_down, "IN 0:0"..downtime)
	else
		txt_set(txt_timer_down,"IN 0:".. downtime)
	end
	if avionics_pwr_flag == false then
		if downtime >= 0 then
			timer_start(1000, nil, time_down)
		elseif downtime < 0 then
			pfd_pwr_flag = false
			visible(txt_timer_down, false)
			visible(img_screen_off, true)
		end
	end
end


function electric(bat_voltage, avionics_on)
	if avionics_on == 1 then
		avionics_pwr_flag = true
		visible(img_battery_level, false)
		visible(img_screen_off, false)
		visible(txt_timer_down, false)
		if pfd_pwr_flag == true then
			visible(img_start, false)
		else
			pfd_pwr_flag = true					
			visible(img_start, true)
			timer_start(2000, nil, power_on)
		end
	else
		avionics_pwr_flag = false
		if pfd_pwr_flag == true then
			visible(img_battery_level, true)	
			downtime = 15
			timer_stop(time_down)
			timer_start(1000, nil, time_down)
			txt_set(txt_timer_down, "IN 0:"..downtime)
			visible(txt_timer_down, true)		
			visible(img_screen_off, false)
		elseif pfd_pwr_flag == false then
			visible(img_battery_level, false)
			visible(img_screen_off, true)
		end
	end
end

------------------------
-- Data bus subscribe --
------------------------
xpl_dataref_subscribe("sim/cockpit2/gauges/indicators/radio_altimeter_height_ft_pilot", "FLOAT",
					  "sim/cockpit/misc/radio_altimeter_minimum", "FLOAT",
					  "sim/flightmodel/misc/h_ind", "FLOAT", 
					  "sim/cockpit2/gauges/indicators/airspeed_kts_pilot", "FLOAT",
					  "sim/aircraft/view/acf_Vne", "FLOAT",
					  "sim/aircraft/view/acf_Vno", "FLOAT", 
					  "sim/cockpit/autopilot/altitude", "FLOAT",
					  "sim/aircraft/view/acf_Vso", "FLOAT",
					  "sim/aircraft/view/acf_Vs", "FLOAT",
					  "sim/aircraft/view/acf_Vfe", "FLOAT",
					  "sim/cockpit2/gauges/indicators/vvi_fpm_pilot", "FLOAT",
					   new_altitude)
--------------------------------------------------------------------------------------------------------------------------
xpl_dataref_subscribe("sim/flightmodel/position/phi", "FLOAT",
					  "sim/flightmodel/position/theta", "FLOAT", 
					  "sim/cockpit2/gauges/indicators/slip_deg", "FLOAT", new_attitude)
--------------------------------------------------------------------------------------------------------------------------
xpl_dataref_subscribe("sim/cockpit/autopilot/airspeed", "FLOAT", 
					  "sim/cockpit/autopilot/altitude", "FLOAT", 
					  "sim/cockpit2/gauges/indicators/airspeed_kts_pilot", "FLOAT", new_infobartop)
--------------------------------------------------------------------------------------------------------------------------
xpl_dataref_subscribe("sim/cockpit/autopilot/autopilot_mode", "INT",
					  "sim/cockpit/autopilot/flight_director_pitch", "FLOAT",
					  "sim/cockpit/autopilot/flight_director_roll", "FLOAT", new_flight_director)
--------------------------------------------------------------------------------------------------------------------------
xpl_dataref_subscribe("sim/flightmodel/position/true_airspeed", "FLOAT",
					  "sim/flightmodel/position/groundspeed", "FLOAT",
					  "sim/cockpit2/temperature/outside_air_temp_degc", "FLOAT",
					  "sim/cockpit2/gauges/indicators/wind_heading_deg_mag", "FLOAT", 
					  "sim/weather/wind_speed_kt", "FLOAT",
					  "sim/cockpit/gyros/psi_ind_degm3", "FLOAT",
					  "sim/cockpit2/gauges/actuators/barometer_setting_in_hg_pilot", "FLOAT", new_infobarcenter)
--------------------------------------------------------------------------------------------------------------------------
xpl_dataref_subscribe("sim/cockpit/gyros/psi_ind_degm3", "FLOAT",
					  "sim/flightmodel/misc/turnrate_roll", "FLOAT",
					  "sim/cockpit2/radios/indicators/nav1_bearing_deg_mag", "FLOAT",
					  "sim/cockpit2/radios/indicators/nav2_bearing_deg_mag", "FLOAT", 
					  "sim/cockpit2/radios/indicators/gps_bearing_deg_mag", "FLOAT",
					  "sim/cockpit2/radios/indicators/gps_dme_distance_nm", "FLOAT", new_heading)
--------------------------------------------------------------------------------------------------------------------------
xpl_dataref_subscribe("sim/cockpit2/gauges/indicators/vvi_fpm_pilot", "FLOAT", new_vsi)
--------------------------------------------------------------------------------------------------------------------------
xpl_dataref_subscribe("sim/cockpit/gyros/psi_vac_ind_degm", "FLOAT",
              "sim/cockpit2/radios/actuators/HSI_source_select_pilot", "INT",
              "sim/cockpit2/radios/actuators/hsi_obs_deg_mag_pilot", "FLOAT",
              "sim/cockpit2/radios/indicators/nav1_hdef_dots_pilot", "FLOAT",
              "sim/cockpit2/radios/indicators/nav2_hdef_dots_pilot", "FLOAT",
              "sim/cockpit2/radios/indicators/gps_hdef_dots_pilot", "FLOAT",
              "sim/cockpit2/radios/indicators/nav1_vdef_dots_pilot", "FLOAT",
              "sim/cockpit2/radios/indicators/nav2_vdef_dots_pilot", "FLOAT",
              "sim/cockpit2/radios/indicators/gps_vdef_dots_pilot", "FLOAT", 
              "sim/cockpit2/radios/indicators/nav1_display_horizontal", "INT", 
              "sim/cockpit2/radios/indicators/nav2_display_horizontal", "INT",
			  "sim/cockpit/autopilot/heading_mag", "FLOAT", 
			  "sim/cockpit/gyros/psi_ind_degm3", "FLOAT",
			  "sim/flightmodel/position/hpath", "FLOAT",
			  "sim/cockpit2/radios/indicators/nav1_flag_from_to_pilot", "INT",
			  "sim/cockpit2/radios/indicators/nav2_flag_from_to_pilot", "INT",
			  "sim/cockpit2/radios/indicators/nav1_flag_glideslope", "INT",
			  "sim/cockpit2/radios/indicators/nav2_flag_glideslope", "INT",
			  "sim/cockpit2/radios/indicators/gps_dme_time_min", "FLOAT", new_HSI)
---------------------------------------------------------------------------------------------------------------------------
xpl_dataref_subscribe("sim/cockpit2/radios/actuators/nav1_frequency_hz", "INT",
			  "sim/cockpit2/radios/actuators/nav2_frequency_hz", "INT",
			  "sim/cockpit2/radios/indicators/gps_nav_id", "STRING", NAV_setup)

---------------------------------------------------------------------------------------------------------------------------
xpl_dataref_subscribe("sim/cockpit2/electrical/battery_voltage_indicated_volts", "FLOAT[8]",
			"sim/cockpit2/switches/avionics_power_on", "INT", electric)	  
