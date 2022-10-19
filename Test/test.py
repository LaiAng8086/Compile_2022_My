import os
import shutil
input_dirs = [
    'D:/BUAA/Junior1/Compile/Experiments/Compile_2022_My/ErrorProcessExamples/Input']
output_dirs = [
    'D:/BUAA/Junior1/Compile/Experiments/Compile_2022_My/ErrorProcessExamples/Output'
]
os.chdir("D:/BUAA/Junior1/Compile/Experiments/Compile_2022_My/Test")
dirs_num = len(input_dirs)
for t in range(dirs_num):
    input_now = input_dirs[t]
    output_now = output_dirs[t]
    files_num = len(os.listdir(input_now))
    for i in range(1, files_num+1):
        shutil.copyfile(input_now+'/testfile'+str(i)+'.txt', 'testfile.txt')
        os.system('java -jar Compile_2022_My.jar Compile')
        print("INPUT="+input_now+'/testfile'+str(i)+'.txt')
        os.system('fc error.txt \"'+output_now+'/output'+str(i)+'.txt\"')
