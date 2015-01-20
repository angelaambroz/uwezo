* *************************************************************************************
* PROGRAM: uwezo_data_prep.do
* PROGRAMMER: Angela Ambroz
* DATE CREATED: 20 January 2015
* DATE MODIFIED: 
* PURPOSE: A d3.js project to visualize English/Math/Swahili scores in Kenya, Tanzania
* and Uganda from 2009, 2010, 2012. 
* USES DATA: 
* CREATES DATA: 
* ***********************************************************************************


**	Preamble	**

clear
clear matrix
cap log c
set mem 500m


**	Setting up the references	**

global uwezo	"$stuff/Projects/d3js/_data/Uwezo"

**	Log	**

local date: di %tdCCYY.NN.DD date(c(current_date),"DMY")

local cti = substr("`c(current_time)'", 1,5)
local cti: subinstr local cti ":" ".", all

log using "$uwezo/logs/`date'_Logged_at_`cti'.log", replace

**	Collapsing	**
// Target: csv file with region, sex, respondents
// Can append year/country later all together. Or should it call diff files?


foreach i in KE TZ UG {
	u "$uwezo/`i'12_hhld.dta", clear
	egen unique = concat(id_hh childNo), format(%24.0f)
	isid unique
	
	collapse (mean) english, by(id_regionName gender)

	g country = ""
	g moment = "`i'"
	
	replace country = "Kenya" if moment == "KE"
	replace country = "Tanzania" if moment == "TZ"
	replace country = "Uganda" if moment == "UG"
	
	g year = 2012
	
	di "`i'"
	
	compress
	tempfile temp`i'
	save temp`i' //things break here
		
	}


**	Appending	**

u "tempKE", clear

foreach i in TZ UG {
	append using "temp`i'"
	} 



//csv

outsheet using "$uwezo/uwezo_data.csv", c replace


	
	
