function Xi=getCB(N,Stack,After,RoudNum)
%����������ĵĵ����������ù�ʽ����xi(node,.)(v)
%N��ָ�������ڽӾ����ά����sָ����Դ�ڵ�,��Ϊ�����������ݶ�����sΪԴ�ڵ�ģ����Բ��ر���s��Դ�ڵ㣻nodeָ��Ҫ����н����Ľڵ�,���ܳ�������
%�ϣ�����Ҳ����Ҫ
clc

% load('NetStack.mat');%������Stack,1*Nά
% load('AfterNode.mat');%������After��N*Nά�����е�һ�д洢��ÿ���ڵ����еĺ�̽ڵ����Ŀ
% load('NetRoudNum.mat');%������ΪRoudNum,1*Nά

%[Stack,After,RoudNum]=BFS_all_shortestRoud(Graph,node,N)

rear=N;

Xi=zeros(1,N);%�������δ洢ÿһ���ڵ��xi(node,.)(v)

%��ջ��Ϊ��ʱ��������ѭ��
while rear>=1 
    %��ջ������ջβԪ�ظ�ֵ��u
    u=Stack(rear);
    rear=rear-1;
    %���ջβԪ���к�̽ڵ㣬�������еı�ʾ����After�ĵ�һ�ж�Ӧ��ֵ����0)
    if After(1,u)~=0
        %��u�к�̽ڵ�ʱ�������̽ڵ�ͨ����ʽ�ۼ�
        for after=2:(After(1,u)+1)
            w=After(after,u);%w��u�ĺ�̽ڵ�
            %Xi(u)=Xi(u)+Delte(node,u)*(1+Xi(w))/Delte(node,w);
            if RoudNum(w)~=0
                Xi(u)=Xi(u)+RoudNum(u)*(1+Xi(w))/RoudNum(w);
            end
        end
    end
end
%�����¼�˴�s������Xi(s,:)(node)
%save NetXi Xi;