function BenCen()
%�������нڵ���н���
%Ҫʹ��BFS_all_shortestRoud.m  ��  getCB.m
%����getCB.mҪʹ��BFS_all_shortestRoud.m���ɵ�����
%�����нڵ���н�����ʱ�临�Ӷ�Ϊ  O��m*n*n��
clc
clear

% load('textmar.mat');%������ڽӾ���,TEXT
% N=6;%�����еĽڵ���Ŀ

load('UpusaAir.mat');%UsaAir
N=332;

BC=zeros(1,N);%����н���
allXi=zeros(N,N);%�ܵ�Xi����

%ͨ�����²����������ڵ��ܵ�Xi����
for s=1:N
    %BFS_all_shortestRoud(TEXT,s,N);
    [Stack,After,RoudNum]=BFS_all_shortestRoud(UsaAir,s,N);%%������Ҫ��
    allXi(s,:)=getCB(N,Stack,After,RoudNum); 
    %��������
%     if s==2
%         Xi=allXi(2,:);
%         save NetStack Stack;
%         save AfterNode After;
%         save NetRoudNum RoudNum;
%         save NetXi Xi;
%     end
end

%�����нڵ���н���
BC=sum(allXi);%sum������þ����к�
BC=BC/(N-1);
BC=BC/(N-2);%��һ��

save yeahBC BC;