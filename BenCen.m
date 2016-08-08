function BenCen()
%求网络中节点的中介数
%要使用BFS_all_shortestRoud.m  和  getCB.m
%其中getCB.m要使用BFS_all_shortestRoud.m生成的数据
%求所有节点的中介数的时间复杂度为  O（m*n*n）
clc
clear

% load('textmar.mat');%网络的邻接矩阵,TEXT
% N=6;%网络中的节点数目

load('UpusaAir.mat');%UsaAir
N=332;

BC=zeros(1,N);%存放中介数
allXi=zeros(N,N);%总的Xi矩阵

%通过以下步骤可以求出节点总的Xi矩阵
for s=1:N
    %BFS_all_shortestRoud(TEXT,s,N);
    [Stack,After,RoudNum]=BFS_all_shortestRoud(UsaAir,s,N);%%换矩阵要改
    allXi(s,:)=getCB(N,Stack,After,RoudNum); 
    %做测试用
%     if s==2
%         Xi=allXi(2,:);
%         save NetStack Stack;
%         save AfterNode After;
%         save NetRoudNum RoudNum;
%         save NetXi Xi;
%     end
end

%求所有节点的中介数
BC=sum(allXi);%sum函数求得就是列和
BC=BC/(N-1);
BC=BC/(N-2);%归一化

save yeahBC BC;