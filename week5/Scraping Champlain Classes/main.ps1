. (Join-Path $PSScriptRoot "classesScraper.ps1")

# Show all classes taught by Furkan (part 1)
# gatherClasses | Select-Object "Class Code", Instructor, Location, Days, "Time Start", "Time End" | 
#    Where-Object {$_.Instructor -ilike "Furkan Paligu" }

# Show all classes in Joyce 310 on Monday (part 2)
# gatherClasses | Where-Object { ($_.Location -eq "JOYC 310") -and ($_.days -ccontains "Monday") } |
#    Select-Object "Time Start", "Time End", "Class Code"

# Gathering all professors in ITS* classes (part 3)
$data = gatherClasses
$ITSInstructors = $data | Where-Object { ( $_."Class Code" -ilike "SYS*") -or
                                         ( $_."Class Code" -ilike "NET*") -or
                                         ( $_."Class Code" -ilike "SEC*") -or
                                         ( $_."Class Code" -ilike "FOR*") -or
                                         ( $_."Class Code" -ilike "CSI*") -or
                                         ( $_."Class Code" -ilike "DAT*") }

# Counting num of each class taught per ITS professor (part 4)
$data | Where-Object { $_.Instructor -in $ITSInstructors.Instructor } `
      | Group-Object "Instructor" | Select Count, Name | Sort Count -Descending
