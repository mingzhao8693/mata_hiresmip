#!/usr/bin/env python
import sys
import os 
sys.path.append('/home/p1l/bin/Python_share/ecmwf-api-client-python')
sys.path.append('/home/p1l/bin/Python_share/simplejson-3.7.3')

from ecmwfapi import ECMWFDataServer
server = ECMWFDataServer()
year = 1979
while ( year < 2017 ):
        if (not os.path.exists("Geop_"+str(year)+".grib")):
		server.retrieve({
    			"class": "ei",
    			"dataset": "interim",
    			"date": str(year)+"-01-01/to/"+str(year)+"-12-31",
    			"expver": "1",
    			"levelist": "1/2/3/5/7/10/20/30/50/70/100/125/150/175/200/225/250/300/350/400/450/500/550/600/650/700/750/775/800/825/850/875/900/925/950/975/1000",
    			"levtype": "pl",
    			"param": "129.128",
    			"step": "0",
    			"grid": "1.5/1.5",
    			"stream": "oper",
    			"target": "Geop_"+str(year)+".grib",
    			"time": "00/06/12/18",
    			"type": "an",
		})

#	if (not os.path.exists("Ucomp_"+str(year)+".grib")):
#		server.retrieve({
#                	"class": "ei",
#                	"dataset": "interim",
#                	"date": str(year)+"-01-01/to/"+str(year)+"-10-31",
#                	"expver": "1",
#                	"levelist": "1/2/3/5/7/10/20/30/50/70/100/125/150/175/200/225/250/300/350/400/450/500/550/600/650/700/750/775/800/825/850/875/900/925/950/975/1000",
#                	"levtype": "pl",
#                	"param": "131.128",
#                	"step": "0",
#                	"grid": "1.5/1.5",
#                	"stream": "oper",
#                	"target": "Ucomp_"+str(year)+".grib",
#                	"time": "00/06/12/18",
#                	"type": "an",
#        	})
#
#	if (not os.path.exists("Vcomp_"+str(year)+".grib") ):
#		server.retrieve({
#                	"class": "ei",
#                	"dataset": "interim",
#                	"date": str(year)+"-01-01/to/"+str(year)+"-10-31",
#                	"expver": "1",
#                	"levelist": "1/2/3/5/7/10/20/30/50/70/100/125/150/175/200/225/250/300/350/400/450/500/550/600/650/700/750/775/800/825/850/875/900/925/950/975/1000",
#                	"levtype": "pl",
#                	"param": "132.128",
#                	"step": "0",
#                	"grid": "1.5/1.5",
#                	"stream": "oper",
#                	"target": "Vcomp_"+str(year)+".grib",
#                	"time": "00/06/12/18",
#                	"type": "an",
#        	})
#        	
#	if (not os.path.exists("Omega_"+str(year)+".grib") ):
#		server.retrieve({
#                	"class": "ei",
#                	"dataset": "interim",
#                	"date": str(year)+"-01-01/to/"+str(year)+"-10-31",
#                	"expver": "1",
#                	"levelist": "1/2/3/5/7/10/20/30/50/70/100/125/150/175/200/225/250/300/350/400/450/500/550/600/650/700/750/775/800/825/850/875/900/925/950/975/1000",
#                	"levtype": "pl",
#                	"param": "135.128",
#                	"step": "0",
#                	"grid": "1.5/1.5",
#                	"stream": "oper",
#                	"target": "Omega_"+str(year)+".grib",
#                	"time": "00/06/12/18",
#                	"type": "an",
#        	})
	year = year+1
#
#year=1980
#while ( year < 2017 ):
#        if (not os.path.exists("Omega_"+str(year)+".grib") ):
#                server.retrieve({
#                        "class": "ei",
#                        "dataset": "interim",
#                        "date": str(year)+"-01-01/to/"+str(year)+"-12-31",
#                        "expver": "1",
#                        "levelist": "1/2/3/5/7/10/20/30/50/70/100/125/150/175/200/225/250/300/350/400/450/500/550/600/650/700/750/775/800/825/850/875/900/925/950/975/1000",
#                        "levtype": "pl",
#                        "param": "135.128",
#                        "step": "0",
#                        "grid": "1.5/1.5",
#                        "stream": "oper",
#                        "target": "Omega_"+str(year)+".grib",
#                        "time": "00/06/12/18",
#                        "type": "an",
#                })
# 	
#	year = year + 1


 
