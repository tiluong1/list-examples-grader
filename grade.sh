CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

files=`find test-files`
PASSED=0
FAILED=0

for file in $files
do
    # check if a file is a txt file
    if [[ -f $file && $file == test*.txt ]]
    then
        # echo "Currently testing" $file
        result=`java AgeCalc < $file`
        # first challenge: print test output 
        expected=`cat $file.expect`
        #echo "Expected file" $expect
        if [[ $result == $expected ]]
        then
            echo "Test Passed!"
            PASSED=$(($PASSED+1))
        else
            echo "Test Failed!"
            FAILED=$(($FAILED+1))
        fi
    fi
done

echo "Your grade is $(($((PASSED*100))/$((PASSED+FAILED))))%"

# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
