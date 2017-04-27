#mol new $file waitfor all   
set numframes [molinfo top get numframes]
set fp [open $file r]
set sel [atomselect top all]

#seek $fp 0
for {set i 0} {$i<$numframes} {incr i} {
gets $fp
gets $fp timestep
gets $fp
gets $fp numatoms
puts "$timestep $numatoms"
gets $fp 
gets $fp 
gets $fp 
gets $fp 
gets $fp line
set numattr [expr [llength $line]-2]

$sel frame $i
set ulist1 ""
set ulist2 ""
set ulist3 ""
set ulist4 ""
puts "setting user values for frame $i."
for {set j 0} {$j<$numatoms} {incr j} {
animate goto $i
gets $fp line
lappend ulist1 [lindex $line [expr $numattr-1]]\n
lappend ulist2 [lindex $line [expr $numattr-2]]\n
lappend ulist3 [lindex $line [expr $numattr-3]]\n
lappend ulist4 [lindex $line [expr $numattr-4]]\n
}
$sel set user $ulist1
$sel set user2 $ulist2
$sel set user3 $ulist3
$sel set user4 $ulist4
}
$sel delete
