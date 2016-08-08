function Xi=getCB(N,Stack,After,RoudNum)
%这个用于论文的第三步：即用公式计算xi(node,.)(v)
%N是指的网络邻接矩阵的维数；s指的是源节点,因为传过来的数据都是以s为源节点的，所以不必表明s是源节点；node指需要求出中介数的节点,在总程序里判
%断，所以也不需要
clc

% load('NetStack.mat');%矩阵名Stack,1*N维
% load('AfterNode.mat');%矩阵名After，N*N维，其中第一行存储的每个节点所有的后继节点的数目
% load('NetRoudNum.mat');%矩阵名为RoudNum,1*N维

%[Stack,After,RoudNum]=BFS_all_shortestRoud(Graph,node,N)

rear=N;

Xi=zeros(1,N);%用于依次存储每一个节点的xi(node,.)(v)

%当栈不为空时进行如下循环
while rear>=1 
    %出栈，并把栈尾元素赋值给u
    u=Stack(rear);
    rear=rear-1;
    %如果栈尾元素有后继节点，（程序中的表示就是After的第一行对应的值不是0)
    if After(1,u)~=0
        %当u有后继节点时，对其后继节点通过公式累加
        for after=2:(After(1,u)+1)
            w=After(after,u);%w是u的后继节点
            %Xi(u)=Xi(u)+Delte(node,u)*(1+Xi(w))/Delte(node,w);
            if RoudNum(w)~=0
                Xi(u)=Xi(u)+RoudNum(u)*(1+Xi(w))/RoudNum(w);
            end
        end
    end
end
%数组记录了从s出发的Xi(s,:)(node)
%save NetXi Xi;