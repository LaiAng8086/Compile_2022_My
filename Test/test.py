import os
import shutil
input_dirs = [
    'D:/BUAA/Junior1/Compile/Experiments/辅助测试库/220926Ver/2022/testfiles-only/A',
    'D:/BUAA/Junior1/Compile/Experiments/辅助测试库/220926Ver/2022/testfiles-only/B',
    'D:/BUAA/Junior1/Compile/Experiments/辅助测试库/220926Ver/2022/testfiles-only/C',
    'D:/BUAA/Junior1/Compile/Experiments/辅助测试库/220926Ver/2021/testfiles-only/A',
    'D:/BUAA/Junior1/Compile/Experiments/辅助测试库/220926Ver/2021/testfiles-only/B',
    'D:/BUAA/Junior1/Compile/Experiments/辅助测试库/220926Ver/2021/testfiles-only/C']
output_dirs = [
    'D:/BUAA/Junior1/Compile/Experiments/辅助测试库/220926Ver/2022/Syntax analysis/A',
    'D:/BUAA/Junior1/Compile/Experiments/辅助测试库/220926Ver/2022/Syntax analysis/B',
    'D:/BUAA/Junior1/Compile/Experiments/辅助测试库/220926Ver/2022/Syntax analysis/C',
    'D:/BUAA/Junior1/Compile/Experiments/辅助测试库/220926Ver/2021/Syntax analysis/A',
    'D:/BUAA/Junior1/Compile/Experiments/辅助测试库/220926Ver/2021/Syntax analysis/B',
    'D:/BUAA/Junior1/Compile/Experiments/辅助测试库/220926Ver/2021/Syntax analysis/C'
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
        os.system('fc output.txt \"'+output_now+'/output'+str(i)+'.txt\"')
        # os.system('PAUSE')
