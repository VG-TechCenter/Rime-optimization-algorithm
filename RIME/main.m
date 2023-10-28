%% 清除环境变量
clear;
close all;
clc;

%% 参数设置
N = 30;             % 种群规模
Function_name = 'F1';         % 从F1到F23的测试函数的名称(F21无法正常显示)
Max_iteration = 500;           % 最大迭代次数
cnt_max = 30;
% 加载所选基准函数的详细信息
[lb, ub, dim, fobj] = Get_Functions_details(Function_name);

Curve_RIME = zeros(1, Max_iteration);

for cnt = 1:cnt_max
    % 初始化种群位置
    X = initialization(N, dim, ub, lb);
 
    [RIME_Best_score(cnt), RIME_Best_pos(cnt, :), RIME_Curve] = RIME(N, Max_iteration, lb, ub, dim, fobj);   


    Curve_RIME = Curve_RIME+RIME_Curve;

end


Curve_RIME = Curve_RIME/cnt_max;

std_RIME = std(RIME_Best_score);

worst_RIME = max(RIME_Best_score);

best_RIME = min(RIME_Best_score);

mean_RIME = mean(RIME_Best_score);


%% 画图
% 1、画出所选基准函数的三维立体图形
figure;
func_plot(Function_name);
title(Function_name)
xlabel('x_1');
ylabel('x_2');
zlabel([Function_name,'( x_1 , x_2 )'])

% 2、画出目标函数值变化曲线图
figure;
t = 1:Max_iteration;
semilogy(t, Curve_RIME,'linewidth', 1.5);

title(Function_name);
xlabel('Iteration');
ylabel('Mean of objective function values');
axis fill
grid on
box on
legend( 'RIME');


%% 显示结果
disp(['函数：', num2str(Function_name)]);
disp(['GWO：最差值: ', num2str(worst_RIME), ', 最优值: ', num2str(best_RIME), ', 平均值: ', num2str(mean_RIME), ', 标准差: ', num2str(std_RIME)]);
