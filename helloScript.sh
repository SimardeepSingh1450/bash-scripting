#! /bin/bash

<<comment
1.Hello Bash Printout :
echo "hello bash"
comment

<<comment
2.Redirect content to file :
echo "hello bash in other created file" > file.txt
comment

<<comment
3.Writing from terminal using cat in script file

NOTE -> cat > file.txt -> Replaces the content inside file.txt

Whereas -> cat >> file.txt -> Appends with the content inside file.txt
comment

<<comment
cat > file.txt
comment

<<comment
cat >> file.txt
comment

: ' 3.Multiline Comments (Another Way ) using -> [ : '' ] '

<<comment
4.We can display comments with cat :
comment

: '
cat <<kreativ
this is comment
section
kreativ '

: '
5.Conditional Statements :
comment '


<<comment
count=10

: ' -eq -> equal-to example:'
if [ $count -eq 9 ]
then
    echo "the condition is true"
else
    echo "the condition is false"
fi
comment


<<comment
: ' -gt -> greater-than example:'
if [ $count -gt 9 ]
then
    echo "the condition is true"
else
    echo "the condition is false"
fi
comment

<<comment
Using angular brackets for conditional statements :
comment


<<comment
count=10

if (( $count > 9 ))
then
    echo "the condition is true"
elif (( $count >=10 ))
then
    echo "number is greater than or equal to 10"
else
    echo "the condition is false"
fi
comment


: '6.&& Opeartor and || Operator : '

<<comment
age=10

if [ $age -gt 18 ] && [ $age -lt 15 ]
then
    echo "Age is Correct"
else
    echo "Age is not correct"
fi
comment


<<comment
age=30
if [[ $age -gt 18 && $age -lt 40 ]]
then
    echo "Age is correct"
else
    echo "Age is not correct"
fi
comment

: ' NOTE-> Similarly OR -> || : '


: '7.Switch case statements '

<<comment
car=3
case $car in
"1")
echo "One" ;;
"2")
echo "Two" ;;
"3")
echo "Three" ;;
*)
echo "Unkown Value Entered " ;;
esac
comment

: '8.Loops :'
: ' While loop :'
<<comment
number=1
while [ $number -le 10 ]
do
    echo "$number"
    number=$(( number + 1 ))
done
comment

: 'Until loop :'
<<comment
number=1
until [ $number -ge 10 ]
do
    echo "$number"
    number=$(( number + 1 ))
done
comment

: 'for loop :'
<<Comment
for i in 1 2 3 4 5
do
    echo $i
done
Comment

: '{start..ending..increment} '
<<comment
for i in {0..20..2}
do
    echo $i
done
comment

<<comment
for (( i=0; i<5 ;i++ ))
do
    echo $i
done
comment

: '9.continue and break :'
<<comment
for (( i=0;i<=10;i++ ))
do
    if [ $i -gt 5 ]
    then
    break
    fi
    echo $i
done
comment

: 'NOTE -> Similarly is continue as in C/C++ '


: '10.Script Input -> $1 $2 $3 $@ $# :'

: ' In Terminal -> ./helloScript.sh BMW MERCEDES TOYOTA -> these car names will be stored as values inside $1 $2 $3 and printed out obv. due to echo command :'
<<comment
echo $1 $2 $3
comment

: 'Q- What if we use $0 also ? '
: '$0 -> Gives the scriptName(helloScript.sh) '
<<comment
echo $0 $1 $2 $3
comment

: '$@ when stored in a variable , then that variable becomes an array :'
<<comment
args=("$@")
echo ${args[0]} ${args[1]} ${args[2]}
comment

: 'To printout all the inputs in array from terminal use -> echo $@ :'
<<comment
args=("$@")
echo $@
comment

: 'We use -> $# to see length of the array '
<<comment
args=("$@")
echo $#
comment

: '11. Reading a file using < :'
: 'Example -> In -> ${1 : -/dev/stdin} if we do not provide the file i.e $1 then assumes terminal is a file :
NOTE-> read means taking a line input in terminal
'
: '
while read line
do
    echo $line
done < "${1: -/dev/stdin}"
'

<<comment
Reading the file.txt (giving $1 a value(filename) in terminal now)
comment

: '
while read line
do
    echo "$line"
done < "${1:-/dev/stdin}"
'

: '12. Script Output '

: '
ls -al 1>OutputFile.txt 2>ErrorFile.txt
'

: 'If we write only >Outputfile then only outputfile is generated and if error exists that errorFile will not be generated'

: '
ls -al >OutputFile2.txt
'

: 'If we want to use a Single File for both O/P and Error then :

ls -al >OutputFile3.txt 2>&1

'

: '13.Pipes ->Sending output from One Script to another'
: '
MESSAGE="Hello ppl"
export MESSAGE
./secondScript.sh
'


: '14.Strings Processing :'

: '
echo "enter the 1st string "
read st1

echo "enter the 2nd string "
read st2

if [ $st1 == $st2 ]
then
    echo "strings match"
else
    echo "strings do not match"
fi
'

: '
echo "enter 1st string"
read st1

echo "enter 2nd string"
read st2

if [ $st1 \< $st2 ]
then
    echo "$st1 is smaller than $st2"
elif [ $st1 \> $st2 ]
then
    echo "$st2 is smaller than $st1"
else
    echo "Strings are equal in length"
fi
'

<<comment
Contatination of strings in a single variable :
c = $st1$st2
comment
: '
echo "Enter the 1st string"
read st1

echo "Enter the 2nd string"
read st2

c=$st1$st2

echo "The contatinated string is : $c"
'

: '
Conversion of strings to pure Lowercase and Uppercase:
echo ${st1^} -> Lowercase
echo ${st2^^} -> Uppercase
'

: 'If we want to convert only 1st Letter to Uppercase in lowercase case then :
echo ${st1^s} -> Here s is my first letter
'
: '
echo "Enter string "
read st1
echo ${st1^s}
'

: '15.Numbers and Arithmetic:'

: 'All calculations : '
: '
n1=4
n2=20

echo "$((n1+n2))"
echo "$((n1-n2))"
echo "$((n1*n2))"
echo "$((n1/n2))"
echo "$((n1%n2))"
'

: '
n1=4
n2=20

echo $(expr $n1 + $n2)
echo $(expr $n1 - $n2)
echo $(expr $n1 \* $n2)
echo $(expr $n1 / $n2)
echo $(expr $n1 % $n2)
'

: 'Conversion of Hexadecimal to decimal using bc calculator: '
: '
echo "Enter the hex number of your choice"
read Hex
echo -n "The decimal value of $Hex is : "
echo "obase=10; ibase=16; $Hex" | bc
'

: '16.Declare Command : '
: 'In terminal -> declare -p   prints all types of variables currently on the system '

: 'In terminal -> declare myvariable=22    creates this variable/added in the set of variables in the system '

: 'In Terminal to change the value of myvariable , type -> declare myvariable=11 , this will change the value of myvariable '

: 'Creating READ ONLY VARIABLES in script:'
: '
declare -r pwdfile=/etc/passwd
echo $pwdfile
pwdfile=/etc/abc.txt
: 'You cannot Change this pwdfile variable to abc.txt path since it is a read only '

'


: '17.Arrays :'
: '
car=('BMW' 'Toyota' 'Honda')
echo "First Element in Array : ${car[0]}"
echo "All elements in Array : ${car[@]}"
echo "All indexes : ${!car[@]}"
echo "Number of elements : ${#car[@]}"
'

: 'Removing/deleting value from Array using unset : '
: '
car=('BMW' 'Toyota' 'Honda')
unset car[2]
echo "${car[@]}"
'

: 'We can readd the deleted value by assigning value:'
: '
car=('BMW' 'Toyota' 'Honda')
unset car[2]
car[2]=2
echo "${car[@]}"
'

: '18.Fucntions :'
: 'For calling a function we just need to put functionName not even () is needed '

: '
function funcName()
{
    echo "this is new function"
}

funcName
'

: 'Calling a function with argument passing '
: 'Arguments passing syntax : funcName Argument_Value1 Argument_Value2 Argument_Value3 '
: '
function funcPrint(){
echo $1 $2 $3
}

funcPrint Hi hola gracias
'

: 'Calling of the function updates the variable:'
: '
function funcCheck(){
returningValue="I love linux"
}

returningValue="I love mac"
echo $returningValue

funcCheck
echo $returningValue
'

: '19.Files and Directories : '
: 'In order to create a directory with same name more than once we use -> -p flag for mkdir'
: 'mkdir -p Directory2 '

: '-d flag is used to check if directory with the name defined after -d exists or not :'

: '
echo "Enter the directory Name"
read direct

if [ -d "$direct" ]
then
    echo "$direct exists"
else
    echo "$direct does not exist"
fi
'

: 'Creating File using touch :'
: '
echo "Enter the name of the file you want to create:"
read fileName
touch $fileName
echo "$fileName created "
'

: '-f fileName is used for checking if fileName exists or not : '
: '
echo "Enter the filename :"
read fileName

if [[ -f "$fileName" ]]
then
    echo "$fileName exists"
else
    echo "$fileName doesnt exist"
fi
'
: 'Appending text to a file using >> :'
: '
echo "Enter the filename in which you want to append text :"
read fileName

if [[ -f "$fileName" ]]
then
    echo "ENter the text that you want to append"
    read fileText
    echo "$fileText" >> $fileName
else
    echo "$fileName doesnt exist"
fi
'

: 'NOTE ->   >  removes all the content from the file and replaces with the new content '

: 'Deleting a File using rm :'
: '
echo "Enter filename to delete :"
read fileName

if [[ -f "$fileName" ]]
then
    rm $fileName
    echo "$fileName has been deleted"
else
    echo "$fileName doesnt exist"
fi
'

: '20.Curl in Scripts (Downloading Files)'
: 'Curl Syntax -> curl ${url} -o FileName '
: 'Another way -> curl ${url} > Filename '

: '
url="http://212.183.159.230/5MB.zip"
curl ${url} -o NewFileDownload
'

: 'To print the RESPONSE/Network details from server :
    curl -I ${url}
'
: '
url="http://212.183.159.230/5MB.zip"
curl -I ${url}
'

: '21. Professional Menus :'
: '
select car in  BMW MERCEDES TESLA ROVER TOYOTA
do
    case $car in
    "BMW")
    echo "BMW SELECTED";;
    "MERCEDES")
    echo "MERCEDES SELECTED";;
    "TESLA")
    echo "TESLA SELECTED";;
    "ROVER")
    echo "ROVER SELECTED";;
    "TOYOTA")
    echo "TOYOTA SELECTED";;
    *)
    echo "Unkown Value";;
    esac
done
'


: 'Giving REMINDERS in terminal until key is not pressed : '
: 'NOTE-> [-t SECONDS]  flag is used to repeat line after SECONDS and [-n VALUE] flag tells how many times the line should be repeated'

: 'NOTE-> $?=0 -> means exit status of last command inserted in the terminal'
: '
echo "press any key to continue"

while [ true ]
do
    read -t 3 -n 1
if [ $? -eq 0 ]
then
    echo "You have terminated the Script"
    exit;
else
    echo "waiting for you to press the key"
fi
done
'

: '22.Introduction to grep :'
: 'Grep is used to print all the lines which consist of a string you search for using grep'
: 'grep syntax-> grep -i $grepvar $fileName'
: 'NOTE-> -i flag is used to remove case senstivity'
: 'NOTE-> We use -n to display line number as well in grep :'
: 'NOTE-> -c indicates the number of times word has existed in the file'
: 'NOTE-> -v displays all the lines except the line that conatains that word'

: '
echo "Enter the filename to search text from"
read fileName

if [[ -f $fileName ]]
then
    echo "Enter the text to Search"
    read grepvar
    grep -i -n -c $grepvar $fileName
else
    echo "$fileName doesnt exist"
fi
'

: '23.Introduction to awk :'
: 'awk scripting is different from bash scripting even the file extension of awk scripting is .awk , but we will be using awk scripting with bash scripting now :'

: 'Reading content from a file using awk : '
: 'SYntax-> awk '{print}' $fileName  '
: '
echo "Enter filename to print from awk"
read fileName

if [ -f $fileName ]
then
    awk '{print}' $fileName
else
    echo "$fileName doesnt exist"
fi
'
: 'Printing lines containing a specific word using awk using -> awk '/word_to_search/ {print}' $fileName'
: '
echo "Enter the filename to print from awk :"
read fileName

if [ -f $fileName ]
then
    awk '/dareda/{print}' $fileName
else
    echo "$fileName doesnt exist"
fi
'


: 'To print a word after a set of words from each line , for example -> we want to print 4th word from each line then we can use :
awk '/word_which_is_needed_in_each_line/{print $4}' '

: 'We can also print multiple words from beginning of each line using ,lets say 2nd and 3rd word :
awk '/word_which_is_needed_in_each_line/{print $2,$3}' '


: '24.Introduction to sed (Screen Editor) :'
: 'Using sed to replace letters :
cat sedfile.txt | sed 's/letter_to_replace/new_letter/'
'
: 'NOTE->sed s/to_replace/new_letter works only for first letter from each line'
: 'Here s/ means substitution'

: '
echo "Enter the filename to substitute using sed"
read fileName

if [ -f $fileName ]
then
    cat sedfile.txt | sed 's/a/b/'
else
    echo "$fileName doesnt exist"
fi
'

: 'NOTE-> To make it substitution on all letters in the file then use /g as well i.e -> sed 's/a/b/g' '

: 'Another simpler syntax of writing sed is :
    sed 's/a/b/g' $fileName
'

: 'NOTE-> We can replace Words aswell using sed , same syntax '


: '25.Debugging BASH Scripts :'
: 'Use->  bash -x ./BashFile.sh ,this shows all the script lines in the bashfile and tests the file in terminal '

: 'Another way to do the same thing is :
    #! /bin/bash -x
'

: 'We use [set -x] and [set +x] , when we want to debug the script lines written in between [set -x] and [set +x] '





