%Neteja la pantalla i elimina la memòria
clear all;

%Missatge del programa
fprintf(1, '\t*****************************************************************\n'); 
fprintf(1, '\t***------Testejament de les formes a la base de siluetes------***\n'); 
fprintf(1, '\t*****************************************************************\n\n'); 

%Declaració Variables
f=0;
c=0;
cont=0;

fprintf(1, '-->Processant la càrrega de la base de siluetes...............');
%carreguem la base de dades
load siluetes.mat

fprintf(1,'OK\n\n'); 
fprintf(1, '-->Processant la càrrega de les formes........................');
%Carreguem siluetes
F{1}=imread('forma1.png');
F{2}=imread('forma2.png');
F{3}=imread('forma3.png');
F{4}=imread('forma4.png');
F{5}=imread('forma5.png');
F{6}=imread('forma6.png');
F{7}=imread('forma7.png');
F{8}=imread('forma8.png');
F{9}=imread('forma9.png');
F{10}=imread('forma10.png');
F{11}=imread('forma11.png');
F{12}=imread('forma12.png');
F{13}=imread('forma13.png');
F{14}=imread('forma14.png');
F{15}=imread('forma15.png');
F{16}=imread('forma16.png');
F{17}=imread('forma17.png');
F{18}=imread('forma18.png');

fprintf(1,'OK\n\n'); 
fprintf(1, '-->Calculant els centroides de les formes.....................');  
%Calcul del centroide 
for x=1:18
    f=0;
    c=0;
    cont=0;
    [files columnes]=size(F{x});
    for i=1:files
        for j=1:columnes
            dada=F{x}(i,j);
            if (dada~=255)
                f=f+i;
                c=c+j;
                cont=cont+1;
            end     
        end
    end
    Ycent{x}=round(f/cont);
    Xcent{x}=round(c/cont);
end

fprintf(1,'OK\n\n'); 
fprintf(1, '-->Calculant els punts de les 8 línies........................');  
%-Linea 0º
for x=1:18
    punty=Ycent{x}; 
    puntx=Xcent{x};
    [files columnes]=size(F{x});
    Ok=0;
    while(puntx<columnes&&Ok==0)
        dada=F{x}(punty, puntx);
        dadaseg=F{x}(punty,puntx+1);
        if (dada~=255&&dadaseg==255)
            negraX0{x}=puntx;
            negraY0{x}=punty;
            Ok=1;
        end
        puntx=puntx+1;
    end
    if(Ok==0)
        negraX0{x}=-1;
        negraY0{x}=-1;
    end
    
end
 
%-Linea 45º
for x=1:18
    punty=Ycent{x}; 
    puntx=Xcent{x};
    [files columnes]=size(F{x});
    Ok=0;
    while (punty>1&&puntx<columnes&&Ok==0)
            dada=F{x}(punty,puntx);
            dadaseg=F{x}(punty-1,puntx+1);
            if (dada~=255&&dadaseg==255)
                negraX45{x}=puntx;
                negraY45{x}=punty;
                Ok=1;
            end
            puntx=puntx+1;
            punty=punty-1;
    end
    if(Ok==0)
        negraX45{x}=-1;
        negraY45{x}=-1;
    end
end
 
%-Linea 90º
for x=1:18
    punty=Ycent{x}; 
    puntx=Xcent{x};
    [files columnes]=size(F{x});
    Ok=0;
    while (punty>1&&Ok==0)
        dada=F{x}(punty,puntx);
        dadaseg=F{x}(punty-1,puntx);
           if (dada~=255&&dadaseg==255)
               negraX90{x}=puntx;
               negraY90{x}=punty;
               Ok=1;
           end
        punty=punty-1;
    end
    if(Ok==0)
        negraX90{x}=-1;
        negraY90{x}=-1;
    end
end
 
%-Linea 135º
for x=1:18
    punty=Ycent{x}; 
    puntx=Xcent{x};
    [files columnes]=size(F{x});
    Ok=0;
    while (punty>1&&puntx>1&&Ok==0)
           dada=F{x}(punty,puntx);
           dadaseg=F{x}(punty-1,puntx-1);
           if (dada~=255&&dadaseg==255)
               negraX135{x}=puntx;
               negraY135{x}=punty;
               Ok=1;
           end
           puntx=puntx-1;
           punty=punty-1;
    end
    if(Ok==0)
        negraX135{x}=-1;
        negraY135{x}=-1;
    end
end
 
%-Linea 180º
for x=1:18
    punty=Ycent{x}; 
    puntx=Xcent{x};
    [files columnes]=size(F{x});
    Ok=0;
    while(puntx>1&&Ok==0)
        dada=F{x}(punty, puntx);
        dadaseg=F{x}(punty,puntx-1);
        if (dada~=255&&dadaseg==255)
            negraX180{x}=puntx;
            negraY180{x}=punty;
            Ok=1;
        end
        puntx=puntx-1;
    end
    if(Ok==0)
        negraX180{x}=-1;
        negraY180{x}=-1;
    end
end
 
%-Linea 225º
for x=1:18
    punty=Ycent{x}; 
    puntx=Xcent{x};
    [files columnes]=size(F{x});
    Ok=0;
    while (punty<files&&puntx>1&&Ok==0)
            dada=F{x}(punty,puntx);
            dadaseg=F{x}(punty+1,puntx-1);
            if (dada~=255&&dadaseg==255)
                negraX225{x}=puntx;
                negraY225{x}=punty;
                Ok=1;
            end
            puntx=puntx-1;
            punty=punty+1;
    end
    if(Ok==0)
       negraX225{x}=-1;
       negraY225{x}=-1;
    end
    
end
 
%-Linea 270º
for x=1:18
    punty=Ycent{x}; 
    puntx=Xcent{x};
    [files columnes]=size(F{x});
    Ok=0;
    while (punty<files&&Ok==0)
        dada=F{x}(punty,puntx);
        dadaseg=F{x}(punty+1,puntx);
           if (dada~=255&&dadaseg==255)
               negraX270{x}=puntx;
               negraY270{x}=punty;
               Ok=1;
           end
        punty=punty+1;
    end
    if(Ok==0)
        negraX270{x}=-1;
        negraY270{x}=-1;
    end
end
 
%-Linea 315º
for x=1:18
    punty=Ycent{x}; 
    puntx=Xcent{x};
    [files columnes]=size(F{x});
    Ok=0;
    while (punty<files&&puntx<columnes&&Ok==0)
            dada=F{x}(punty,puntx);
            dadaseg=F{x}(punty+1,puntx+1);
            if (dada~=255&&dadaseg==255)
                negraX315{x}=puntx;
                negraY315{x}=punty;
                Ok=1;
            end
            puntx=puntx+1;
            punty=punty+1;
    end
    if(Ok==0)
         negraX315{x}=-1;
         negraY315{x}=-1;
    end
end

fprintf(1,'OK\n\n');
fprintf(1, '-->Calculant les distàncies...................................'); 
%Calculem les distancies
for x=1:18
    if (negraX0{x}==-1)
        negraX0{x}=-negraX180{x};
        negraY0{x}=-negraY180{x};
    end
    a=negraX0{x}-Xcent{x};
    b=negraY0{x}-Ycent{x};
    distancia0{x}=round(sqrt((a^2)+(b^2)));
    
    if (negraX45{x}==-1)
        negraX45{x}=-negraX225{x};
        negraY45{x}=-negraY225{x};
    end
    a=negraX45{x}-Xcent{x};
    b=negraY45{x}-Ycent{x};
    distancia45{x}=round(sqrt((a^2)+(b^2)));
    
    if (negraX90{x}==-1)
        negraX90{x}=-negraX270{x};
        negraY90{x}=-negraY270{x};
    end
    a=negraX90{x}-Xcent{x};
    b=negraY90{x}-Ycent{x};
    distancia90{x}=round(sqrt((a^2)+(b^2)));
    
    if (negraX135{x}==-1)
        negraX135{x}=-negraX315{x};
        negraY135{x}=-negraY315{x};
    end
    a=negraX135{x}-Xcent{x};
    b=negraY135{x}-Ycent{x};
    distancia135{x}=round(sqrt((a^2)+(b^2)));
    
    if (negraX180{x}==-1)
        negraX180{x}=-negraX0{x};
        negraY180{x}=-negraY0{x};
    end
    a=negraX180{x}-Xcent{x};
    b=negraY180{x}-Ycent{x};
    distancia180{x}=round(sqrt((a^2)+(b^2)));
    
    if (negraX225{x}==-1)
        negraX225{x}=-negraX45{x};
        negraY225{x}=-negraY45{x};
    end
    a=negraX225{x}-Xcent{x};
    b=negraY225{x}-Ycent{x};
    distancia225{x}=round(sqrt((a^2)+(b^2)));
    
    if (negraX270{x}==-1)
        negraX270{x}=-negraX90{x};
        negraY270{x}=-negraY90{x};
    end
    a=negraX270{x}-Xcent{x};
    b=negraY270{x}-Ycent{x};
    distancia270{x}=round(sqrt((a^2)+(b^2)));
    
    if (negraX315{x}==-1)
        negraX315{x}=-negraX135{x};
        negraY315{x}=-negraY135{x};
    end
    a=negraX315{x}-Xcent{x};
    b=negraY315{x}-Ycent{x};
    distancia315{x}=round(sqrt((a^2)+(b^2)));
    
end

fprintf(1,'OK\n\n');
fprintf(1, '-->Calculant els vectors de les distancies....................'); 
%Fem el vector de les distancies
x=1;
while (x<=18)
        forma(1,x)=distancia0{x};
        forma(2,x)=distancia45{x};
        forma(3,x)=distancia90{x};
        forma(4,x)=distancia135{x};
        forma(5,x)=distancia180{x};
        forma(6,x)=distancia225{x};
        forma(7,x)=distancia270{x};
        forma(8,x)=distancia315{x};
        x=x+1;
end

fprintf(1,'OK\n\n');
fprintf(1, '-->Calculant la norma dels vectors............................');         
%Fem la norma dels vectors de les distancies
    norma{1}=norm(forma(:,1),2);
    norma{2}=norm(forma(:,2),2);
    norma{3}=norm(forma(:,3),2);
    norma{4}=norm(forma(:,4),2);
    norma{5}=norm(forma(:,5),2);
    norma{6}=norm(forma(:,6),2);
    norma{7}=norm(forma(:,7),2);
    norma{8}=norm(forma(:,8),2);
    norma{9}=norm(forma(:,9),2);
    norma{10}=norm(forma(:,10),2);
    norma{11}=norm(forma(:,11),2);
    norma{12}=norm(forma(:,12),2);
    norma{13}=norm(forma(:,13),2);
    norma{14}=norm(forma(:,14),2);
    norma{15}=norm(forma(:,15),2);
    norma{16}=norm(forma(:,16),2);
    norma{17}=norm(forma(:,17),2);
    norma{18}=norm(forma(:,18),2);



fprintf(1,'OK\n\n');
fprintf(1, '-->Calculant els vectors unitaris dels vectors distancia......'); 
%Fem el unitari
    formes(:,1)=forma(:,1)/norma{1};
    formes(:,2)=forma(:,2)/norma{2};
    formes(:,3)=forma(:,3)/norma{3};
    formes(:,4)=forma(:,4)/norma{4};
    formes(:,5)=forma(:,5)/norma{5};
    formes(:,6)=forma(:,6)/norma{6};
    formes(:,7)=forma(:,7)/norma{7};
    formes(:,8)=forma(:,8)/norma{8};
    formes(:,9)=forma(:,9)/norma{9};
    formes(:,10)=forma(:,10)/norma{10};
    formes(:,11)=forma(:,11)/norma{11};
    formes(:,12)=forma(:,12)/norma{12};
    formes(:,13)=forma(:,13)/norma{13};
    formes(:,14)=forma(:,14)/norma{14};
    formes(:,15)=forma(:,15)/norma{15};
    formes(:,16)=forma(:,16)/norma{16};
    formes(:,17)=forma(:,17)/norma{17};
    formes(:,18)=forma(:,18)/norma{18};

fprintf(1,'OK\n\n');
fprintf(1, '-->Carregant la base de dades de siluetes.....................'); 
load ('siluetes')

fprintf(1,'OK\n\n');
fprintf(1, '-->Testejant les formes amb la base de dades de siluetes......'); 

for x=1:7
    for i=1:12
        for j=1:18
            vectorcomp=siluetes(:,i)-formes(:,j);
            vectorcomp=abs(vectorcomp);
            matriucomp(i,j)=0;
            for k=1:8
                matriucomp(i,j)=matriucomp(i,j)+vectorcomp(k);
            end
            if x~=1&&matriucomp(i,j)<ant(i,j)
                final(i,j)=matriucomp(i,j);
            end
            if x==1
                final=matriucomp;
            end
        end
    end
    aux=siluetes(1,:);
    siluetes(1,:)=siluetes(2,:);
    siluetes(2,:)=siluetes(3,:);
    siluetes(3,:)=siluetes(4,:);
    siluetes(4,:)=siluetes(5,:);
    siluetes(5,:)=siluetes(6,:);
    siluetes(6,:)=siluetes(7,:);
    siluetes(7,:)=siluetes(8,:);
    siluetes(8,:)=aux;
    ant=final;
end

fprintf(1,'OK\n\n');
fprintf(1, '-->Obtenint resultats.........................................'); 
fprintf(1,'OK\n\n');

fprintf(1, '\t\t   *****************************************************************\n'); 
fprintf(1, '\t\t   ************----------------RESULTATS----------------************\n'); 
fprintf(1, '\t\t   *****************************************************************\n\n'); 

for i=1:18
    minim=10;
    for j=1:12
        if final (j,i)<minim;
            minim= final (j,i);
            sil=j;
        end
    end
    if(minim>1)
            fprintf(1,'\t\t-->La forma %d no correspon a cap silueta de la base de dades\n', i);
    else
            probabilitat=round((minim*-100)+100);
            fprintf(1,'\t·Hi ha una probabilitat del %d%% de que la forma %d correspongui a la silueta %d\n',probabilitat,i,sil);
    end
end

fprintf(1,'\n-->Per a veure la comparació de cada forma amb cada silueta, consulta la variable <final><--\n')
