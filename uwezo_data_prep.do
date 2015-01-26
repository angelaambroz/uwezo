* *************************************************************************************
* PROGRAM: uwezo_data_prep.do
* PROGRAMMER: Angela Ambroz
* DATE CREATED: 20 January 2015
* DATE MODIFIED: 
* PURPOSE: A d3.js project to visualize English/Math/Swahili scores in Kenya, Tanzania
* and Uganda from 2009, 2010, 2012. 
* USES DATA: Everything I could find here: http://www.uwezo.net/publications/datasets/?y=2009/10
* CREATES DATA: KE10.csv, KE11.csv, etc...
* ***********************************************************************************


**	Preamble	**

clear
clear matrix
cap log c
set mem 500m

**	Globals	**

global uwezo	"$stuff/Projects/d3js/p_uwezo"
global data		"$stuff/Projects/d3js/_data/Uwezo"


**	Log	**

local date: di %tdCCYY.NN.DD date(c(current_date),"DMY")

local cti = substr("`c(current_time)'", 1,5)
local cti: subinstr local cti ":" ".", all

log using "$data/logs/`date'_Logged_at_`cti'.log", replace

**	Collapsing	**
// Target: csv file with region, sex, respondents
// Can append year/country later all together.

/*

foreach i in KE TZ UG {
	foreach j in 10 11 12 {
		u "$data/`i'`j'_hhld.dta", clear
		
		collapse (mean) english math, by(id_regionName gender)

		g year = .
		g country = ""
		g moment = "`i'"
		g moment2 = "`j'"
		
		replace country = "Kenya" if moment == "KE"
		replace country = "Tanzania" if moment == "TZ"
		replace country = "Uganda" if moment == "UG"
		
		replace year = 2010 if moment2 == "10"
		replace year = 2011 if moment2 == "11"
		replace year = 2012 if moment2 == "12"
		
		di "`i'" "`j'"
		
		compress
		tempfile temp`i'`j'
		save temp`i'`j', replace 
		}
	}

	
**	Appending	**


foreach i in KE UG TZ {
	foreach j in 10 11 12 {
	
	rename id_regionName region
	drop moment*

	//csv

	if c(os)=="Windows" {
		outsheet using "$uwezo/`i'`j'.csv", c replace
	}
	if c(os)=="MacOSX" {
		outsheet using "$uwezo/../../p_uwezo/`i'`j'.csv", c replace
	}

	}

}

*/

**	Post-script: Splitting them up	**


foreach i in KE UG TA {
	insheet using "$uwezo/`i'`j'.csv", clear
	outsheet using "$uwezo/`i'10.csv" if year==2010, c replace
	outsheet using "$uwezo/`i'11.csv" if year==2011, c replace
	outsheet using "$uwezo/`i'12.csv" if year==2012, c replace
}





