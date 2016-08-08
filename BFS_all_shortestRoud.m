function [Stack,After,RoudNum]=BFS_all_shortestRoud(Graph,node,N)
clc
%�˳�����ͨ���������ͼ��BFS������ڵ�node�����нڵ����С·��������ͬʱ���ÿ���ڵ������ֱ�Ӻ�̽ڵ�ľ���
%�����ӵ�Ԫ�ش���ջ��
%��������Graph��ָ������ͼ���ڽӾ���nodeָ��node���������Դ�㣻Nָ���������еĽڵ����
%Ŀ����������ĵĵ�һ����
%��һ��������ѡ����Դ�ڵ�node����BFS����delte(node,others)
%�ڶ������������̽��ڵ�����ջ�У�ͬʱ�����ڵ�ĺ�̽ڵ�

Dis=(N+1)*ones(1,N);%�������ָ����node���ڵ�u�ľ���,���Ի�Ϊ����ֵ
RoudNum=zeros(1,N);%��ʾ�ڵ�node��ڵ�u֮������·���м���
RoudNum(node)=0;%�Լ����Լ�û�����·��
Dis(node)=0;%�Լ����Լ������·��Ϊ0

Queue=zeros(1,N);%��ʾ���У�BFSҪͨ��������ʵ��
qhead=1;%����
qrear=1;%��β

Stack=zeros(1,N);%��ʾջ����һ����Ҫջ���в���
shead=1;%ջ��
srear=1;%ջβ

%ÿ���ڵ��ֱ�Ӻ��,����ط��洢�ռ�϶����ô���
%���е�һ�б�ʾ���кŶ�Ӧ�ڵ�ĺ�̽ڵ�������After(1,5)��ʾ���ڵ�5�ĺ�̽ڵ���Ŀ����ʱ��׷��After(1,5)�Ϳ�����
%���ֲ����ϱߵ�˵����׷�ٵ��䲻Ϊ���Ԫ�ؾͿ�����,����Ҫ�ã���Ȼ�Ҵ��ʱ��Ƚ��鷳
After=zeros(N,N);

%��Դ�ڵ㣬Ҳ����node���
Queue(qrear)=node;
qrear=qrear+1;

%�ÿռ任�ҵ��߼���
visited=zeros(1,N);

%�����в�Ϊ��ʱ��Ҳ���Ƕ��ײ����ڶ�βʱ��ִ������ѭ��
while(qhead<qrear)
    %������Ԫ�س���,��������Ԫ�ص�ֵ�Ĵ浽u��,������ӵ�Ԫ�ش浽ջ��
    Stack(srear)=Queue(qhead);
    srear=srear+1;%ջ��ջβָ��ָ����Ԫ�صĺ�һλ
    u=Queue(qhead);
    qhead=qhead+1;
    %���ڵ�u���ٽ��ڵ�ʱ
    for neighbor=1:N
        if(Graph(u,neighbor)==1)
            w=neighbor;
            if Dis(w)>=Dis(u)+1 %����¼���ľ���С�ڵ���ԭ���ľ���
                if visited(w)==0 %ֻ���ǵ�һ���ҵ�wʱ�����
                    Queue(qrear)=w;
                    qrear=qrear+1;%�ӵĶ�βԪ��ָ��Ҳ��ָ����Ԫ�صĺ�һλ��
                end      
                visited(w)=1;
                if RoudNum(u)==0
                    RoudNum(w)=1;
                else
                    RoudNum(w)=RoudNum(w)+RoudNum(u);%·������wԭ����·����+w��ֱ��ǰ�̽ڵ�v��·����
                end
                Dis(w)=Dis(u)+1;%node��w�ľ���
                After(1,u)=After(1,u)+1;%����̴�����
                After(After(1,u)+1,u)=w;
            end
        end
    end
end

 %save NetStack Stack;
% save AfterNode After;
% save NetRoudNum RoudNum;