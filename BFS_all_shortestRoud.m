function [Stack,After,RoudNum]=BFS_all_shortestRoud(Graph,node,N)
clc
%此程序是通过广度搜索图（BFS）来求节点node到所有节点的最小路径总数，同时输出每个节点的所有直接后继节点的矩阵
%将出队的元素存入栈中
%其中输入Graph是指的拓扑图的邻接矩阵；node指从node点出发，即源点；N指的是网络中的节点个数
%目的是完成论文的第一二步
%第一步：根据选定的源节点node，做BFS计算delte(node,others)
%第二步：遍历过程将节点推入栈中，同时保留节点的后继节点

Dis=(N+1)*ones(1,N);%距离矩阵，指的是node到节点u的距离,初试化为极大值
RoudNum=zeros(1,N);%表示节点node与节点u之间的最短路径有几条
RoudNum(node)=0;%自己到自己没有最短路径
Dis(node)=0;%自己到自己的最短路径为0

Queue=zeros(1,N);%表示队列，BFS要通过队列来实现
qhead=1;%队首
qrear=1;%队尾

Stack=zeros(1,N);%表示栈，下一步需要栈进行操作
shead=1;%栈首
srear=1;%栈尾

%每个节点的直接后继,这个地方存储空间肯定采用大了
%其中第一行表示，行号对应节点的后继节点数；即After(1,5)表示，节点5的后继节点数目，到时候追踪After(1,5)就可以了
%发现不用上边的说明，追踪到其不为零的元素就可以了,还是要用，不然我存的时候比较麻烦
After=zeros(N,N);

%将源节点，也就是node入队
Queue(qrear)=node;
qrear=qrear+1;

%用空间换我的逻辑简单
visited=zeros(1,N);

%当队列不为空时，也就是队首不大于队尾时，执行如下循环
while(qhead<qrear)
    %将队首元素出队,并将队首元素的值寄存到u里,并令出队的元素存到栈里
    Stack(srear)=Queue(qhead);
    srear=srear+1;%栈的栈尾指针指向有元素的后一位
    u=Queue(qhead);
    qhead=qhead+1;
    %当节点u有临近节点时
    for neighbor=1:N
        if(Graph(u,neighbor)==1)
            w=neighbor;
            if Dis(w)>=Dis(u)+1 %如果新计算的距离小于等于原来的距离
                if visited(w)==0 %只有是第一次找到w时才入队
                    Queue(qrear)=w;
                    qrear=qrear+1;%队的队尾元素指针也是指向了元素的后一位；
                end      
                visited(w)=1;
                if RoudNum(u)==0
                    RoudNum(w)=1;
                else
                    RoudNum(w)=RoudNum(w)+RoudNum(u);%路径数是w原来的路径数+w的直接前继节点v的路径数
                end
                Dis(w)=Dis(u)+1;%node到w的距离
                After(1,u)=After(1,u)+1;%将后继存起来
                After(After(1,u)+1,u)=w;
            end
        end
    end
end

 %save NetStack Stack;
% save AfterNode After;
% save NetRoudNum RoudNum;