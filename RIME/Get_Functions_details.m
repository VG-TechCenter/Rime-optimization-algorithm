% 此函数包含基准的完整信息和实现
% 文献[1]中表1的函数
% lb是下限: lb=[lb_1,lb_2,...,lb_d]
% up是上限: ub=[ub_1,ub_2,...,ub_d]
% dim是变量的数量（问题的维度）
function [lb, ub, dim, fobj] = Get_Functions_details(F)
switch F
    case 'F1'
        fobj = @F1;
        lb=-100;
        ub=100;
        dim=30;
        
    case 'F2'
        fobj = @F2;
        lb=-10;
        ub=10;
        dim=30;
        
    case 'F3'
        fobj = @F3;
        lb=-10;
        ub=10;
        dim=30;
        
    case 'F4'
        fobj = @F4;
        lb=-100;
        ub=100;
        dim=30;
        
    case 'F5'
        fobj = @F5;
        lb=-100;
        ub=100;
        dim=30;
        
    case 'F6'
        fobj = @F6;
        lb=-30;
        ub=30;
        dim=30;
        
    case 'F7'
        fobj = @F7;
        lb=-50;
        ub=50;
        dim=30;
        
    case 'F8'
        fobj = @F8;
        lb=-1.28;
        ub=1.28;
        dim=30;
        
    case 'F9'
        fobj = @F9;
        lb=-1.28;
        ub=1.28;
        dim=30;
        
    case 'F10'
        fobj = @F10;
        lb=-1;
        ub=1;
        dim=30;
        
    case 'F11'
        fobj = @F11;
        lb=-5.12;
        ub=5.12;
        dim=30;
        
    case 'F12'
        fobj = @F12;
        lb=-32;
        ub=32;
        dim=30;
        
    case 'F13'
        fobj = @F13;
        lb=-600;
        ub=600;
        dim=30;
        
    case 'F14'
        fobj = @F14;
        lb=-10;
        ub=10;
        dim=30;
        
    case 'F15'
        fobj = @F15;
        lb=-10;
        ub=10;
        dim=30;
        
    case 'F16'
        fobj = @F16;
        lb=-1;
        ub=1;
        dim=30;
        
    case 'F17'
        fobj = @F17;
        lb=-5;
        ub=10;
        dim=30;
        
    case 'F18'
        fobj = @F18;
        lb=-100;
        ub=100;
        dim=30;
        
    case 'F19'
        fobj = @F19;
        lb=-5;
        ub=5;
        dim=30;
        
    case 'F20'
        fobj = @F20;
        lb=-100;
        ub=100;
        dim=30;     
        
    case 'F21'
        fobj = @F21;
        lb=-100;
        ub=100;
        dim=30;    
        
    case 'F22'
        fobj = @F22;
        lb=-100;
        ub=100;
        dim=30;    
        
    case 'F23'
        fobj = @F23;
        lb=-100;
        ub=100;
        dim=30;              
end

end

% F1

function o = F1(x)
o=sum(x.^2);
end

% F2

function o = F2(x)
dim=size(x,2);
o=sum([1:dim].*x.^2);
end

% F3

function o = F3(x)
o=sum(abs(x))+prod(abs(x));
end

% F4

function o = F4(x)
dim=size(x,2);
o=0;
for i=1:dim
    o=o+sum(x(1:i))^2;
end
end

% F5

function o = F5(x)
o=max(abs(x));
end

% F6

function o = F6(x)
dim=size(x,2);
o=sum(100*(x(2:dim)-(x(1:dim-1).^2)).^2+(x(1:dim-1)-1).^2);
end

% F7

function o = F7(x)
dim=size(x,2);
o=.1*((sin(3*pi*x(1)))^2+sum((x(1:dim-1)-1).^2.*(1+(sin(3.*pi.*x(2:dim))).^2))+...
((x(dim)-1)^2)*(1+(sin(2*pi*x(dim)))^2))+sum(Ufun(x,5,100,4));
end

% F8

function o = F8(x)
dim=size(x,2);
o=sum([1:dim].*(x.^4));
end

% F9

function o = F9(x)
dim=size(x,2);
o=sum([1:dim].*(x.^4))+rand;
end

% F10

function o = F10(x)
dim=size(x,2);
o=sum(abs(x).^[2:dim+1]);
end

% F11

function o = F11(x)
dim=size(x,2);
o=sum(x.^2-10*cos(2*pi*x))+10*dim;
end

% F12

function o = F12(x)
dim=size(x,2);
o=-20*exp(-.2*sqrt(sum(x.^2)/dim))-exp(sum(cos(2*pi.*x))/dim)+20+exp(1);
end

% F13

function o = F13(x)
dim=size(x,2);
o=sum(x.^2)/4000-prod(cos(x./sqrt([1:dim])))+1;
end

% F14

function o = F14(x)
dim=size(x,2);
o=sum((x(1:dim-1)-1).^2.*(1+(sin(3*pi*x(2:dim)))).^2)+sin(3*pi*x(1))^2+abs(x(dim)-1).*(1+sin(3*pi*x(dim))^2);
end

% F15

function o = F15(x)
o=sum(abs(x.*sin(x)+.1*x));
end

% F16

function o = F16(x)
dim=size(x,2);
o=0.1*dim-(0.1*sum(cos(5*pi*x))-sum(x.^2));
end

% F17

function o = F17(x)
dim=size(x,2);
o=sum(x.^2)+(0.5*sum([1:dim].*x))^2+(0.5*sum([1:dim].*x))^4;
end

% F18

function o = F18(x)
dim=size(x,2);
o=sum(0.5+(sin(sqrt(100*x(1:dim-1).^2+x(2:dim).^2)).^2-0.5)./(1+0.001*(x(1:dim-1).^2-2*x(1:dim-1).*x(2:dim)+x(2:dim).^2).^2));
end

% F19

function o = F19(x)
dim=size(x,2);
o=0.1*sin(3*pi*x(1))^2+sum((x(1:dim-1)-1).^2.*(1+(sin(3*pi*x(2:dim))).^2))+(x(dim)-1)^2*(1+(sin(2*pi*x(dim)))^2);
end

% F20

function o = F20(x)
dim=size(x,2);
o=sum((10^6).^(([0:dim-1])./(dim-1)).*x.^2);
end

% F21

function o = F21(x)
dim=size(x,2);
o=(-1)^(dim+1)*prod(cos(x).*exp(-sum((x-pi).^2)));
end

% F22

function o = F22(x)
o=1-cos(2*pi*sqrt(sum(x.^2)))+0.1*sqrt(sum(x.^2));
end

% F23

function o = F23(x)
o=0.5+(sin(sqrt(sum(x.^2)))^2-0.5)/(1+0.001*sum(x.^2))^2;
end

function o=Ufun(x,a,k,m)
o=k.*((x-a).^m).*(x>a)+k.*((-x-a).^m).*(x<(-a));
end
