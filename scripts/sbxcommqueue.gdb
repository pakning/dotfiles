# This file, packets.gdb, is part of SPARQLverse and its purpose is documented below
# Copyright (C) 2012-2015 SPARQL City, Inc.
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at SPARQL City's option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
# 
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
# 
# SPARQL City Inc. is the original author of this material, unless otherwise noted below.
# Please send generally useful enhancements to SPARQL City in the form of all modified
# source files including an explanation of the changes.  For more
# information see our website at www.sparqlcity.org.
# 
# Do not remove or modify the license information above or the following
# SPARQL City source control information from this file.
# 
# SPARQLverse filename: packets.gdb
# SPARQLverse version:  2.1.11
# Release date:         Wed Feb 25 12:19:25 2015
define count_packets
set $count = 0
set $packet = $arg0
while ( $packet )
  set $packet = $packet->next_in_queue
  set $count = $count+1
end
printf "found %d packets\n", $count
end
