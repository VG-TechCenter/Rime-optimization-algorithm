%% �����������
clear;
close all;
clc;

%% ��������
N = 30;             % ��Ⱥ��ģ
Function_name = 'F1';         % ��F1��F23�Ĳ��Ժ���������(F21�޷�������ʾ)
Max_iteration = 500;           % ����������
cnt_max = 30;
% ������ѡ��׼��������ϸ��Ϣ
[lb, ub, dim, fobj] = Get_Functions_details(Function_name);

Curve_RIME = zeros(1, Max_iteration);

for cnt = 1:cnt_max
    % ��ʼ����Ⱥλ��
    X = initialization(N, dim, ub, lb);
 
    [RIME_Best_score(cnt), RIME_Best_pos(cnt, :), RIME_Curve] = RIME(N, Max_iteration, lb, ub, dim, fobj);   


    Curve_RIME = Curve_RIME+RIME_Curve;

end


Curve_RIME = Curve_RIME/cnt_max;

std_RIME = std(RIME_Best_score);

worst_RIME = max(RIME_Best_score);

best_RIME = min(RIME_Best_score);

mean_RIME = mean(RIME_Best_score);


%% ��ͼ
% 1��������ѡ��׼��������ά����ͼ��
figure;
func_plot(Function_name);
title(Function_name)
xlabel('x_1');
ylabel('x_2');
zlabel([Function_name,'( x_1 , x_2 )'])

% 2������Ŀ�꺯��ֵ�仯����ͼ
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


%% ��ʾ���
disp(['������', num2str(Function_name)]);
disp(['GWO�����ֵ: ', num2str(worst_RIME), ', ����ֵ: ', num2str(best_RIME), ', ƽ��ֵ: ', num2str(mean_RIME), ', ��׼��: ', num2str(std_RIME)]);
