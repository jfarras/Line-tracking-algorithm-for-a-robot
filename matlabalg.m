%Neteja la pantalla i elimina la memòria
clc;
clear all;
 
%Declaració Variables
f=0;
c=0;
cont=0;

%Missatge de benvinguda
fprintf(1, '\t*****************************************************************\n'); 
fprintf(1, '\t***--------Benvingut al Seguidor de Línies del LsMaker--------***\n'); 
fprintf(1, '\t*****************************************************************\n\n'); 

fprintf(1, '-->Processant la càrrega de les siluetes a la base de dades...'); 
%Carreguem siluetes
S{1}=imread('silueta1.png');
S{2}=imread('silueta2.png');
S{3}=imread('silueta3.png');
S{4}=imread('silueta4.png');
S{5}=imread('silueta5.png');
S{6}=imread('silueta6.png');
S{7}=imread('silueta7.png');
S{8}=imread('silueta8.png');
S{9}=imread('silueta9.png');
S{10}=imread('silueta10.png');
S{11}=imread('silueta11.png');
S{12}=imread('silueta12.png');

fprintf(1,'OK\n\n');
fprintf(1, '-->Calculant el centroide de les siluetes.....................'); 
%Calculem el centroide
for x=1:12
    f=0;
    c=0;
    cont=0;
    [files columnes]=size(S{x});  
    for i=1:files
        for j=1:columnes
           dada=S{x}(i,j);
            if (dada==0)
                f=f+i;
                c=c+j;
                cont=cont+1;
            end     
       end
    end
    Ycent{x}=round(f/cont);
    Xcent{x}=round(c/cont);
end
 
%Calculem els 8 punts
fprintf(1,'OK\n\n'); 
fprintf(1, '-->Calculant els punts de les 8 línies........................');  
%-Linea 0º
for x=1:12
    punty=Ycent{x}; 
    puntx=Xcent{x};
    [files columnes]=size(S{x});
    Ok=0;
    while(puntx<=columnes&&Ok==0)
        dada=S{x}(punty, puntx);
        dadaseg=S{x}(punty,puntx+1);
        if (dada==0&&dadaseg==255)
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
for x=1:12
    punty=Ycent{x}; 
    puntx=Xcent{x};
    [files columnes]=size(S{x});
    Ok=0;
    while (punty>=1&&puntx<=columnes&&Ok==0)
            dada=S{x}(punty,puntx);
            dadaseg=S{x}(punty-1,puntx+1);
            if (dada==0&&dadaseg==255)
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
for x=1:12
    punty=Ycent{x}; 
    puntx=Xcent{x};
    [files columnes]=size(S{x});
    Ok=0;
    while (punty>=1&&Ok==0)
        dada=S{x}(punty,puntx);
        dadaseg=S{x}(punty-1,puntx);
           if (dada==0&&dadaseg==255)
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
for x=1:12
    punty=Ycent{x}; 
    puntx=Xcent{x};
    [files columnes]=size(S{x});
    Ok=0;
    while (punty>=1&&puntx>=1&&Ok==0)
           dada=S{x}(punty,puntx);
           dadaseg=S{x}(punty-1,puntx-1);
           if (dada==0&&dadaseg==255)
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
for x=1:12
    punty=Ycent{x}; 
    puntx=Xcent{x};
    [files columnes]=size(S{x});
    Ok=0;
    while(puntx>=1&&Ok==0)
        dada=S{x}(punty, puntx);
        dadaseg=S{x}(punty,puntx-1);
        if (dada==0&&dadaseg==255)
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
for x=1:12
    punty=Ycent{x}; 
    puntx=Xcent{x};
    [files columnes]=size(S{x});
    Ok=0;
    while (punty<files&&puntx>1&&Ok==0)
            dada=S{x}(punty,puntx);
            dadaseg=S{x}(punty+1,puntx-1);
            if (dada==0&&dadaseg==255)
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
for x=1:12
    punty=Ycent{x}; 
    puntx=Xcent{x};
    [files columnes]=size(S{x});
    Ok=0;
    while (punty<files&&Ok==0)
        dada=S{x}(punty,puntx);
        dadaseg=S{x}(punty+1,puntx);
           if (dada==0&&dadaseg==255)
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
for x=1:12
    punty=Ycent{x}; 
    puntx=Xcent{x};
    [files columnes]=size(S{x});
    Ok=0;
    while (punty<files&&puntx<columnes&&Ok==0)
            dada=S{x}(punty,puntx);
            dadaseg=S{x}(punty+1,puntx+1);
            if (dada==0&&dadaseg==255)
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
for x=1:12
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
while (x<=12)
        silueta(1,x)=distancia0{x};
        silueta(2,x)=distancia45{x};
        silueta(3,x)=distancia90{x};
        silueta(4,x)=distancia135{x};
        silueta(5,x)=distancia180{x};
        silueta(6,x)=distancia225{x};
        silueta(7,x)=distancia270{x};
        silueta(8,x)=distancia315{x};
        x=x+1;
end

fprintf(1,'OK\n\n');
fprintf(1, '-->Calculant de la norma......................................');         
%Fem la norma dels vectors de le sdistancies
    norma{1}=norm(silueta(:,1),2);
    norma{2}=norm(silueta(:,2),2);
    norma{3}=norm(silueta(:,3),2);
    norma{4}=norm(silueta(:,4),2);
    norma{5}=norm(silueta(:,5),2);
    norma{6}=norm(silueta(:,6),2);
    norma{7}=norm(silueta(:,7),2);
    norma{8}=norm(silueta(:,8),2);
    norma{9}=norm(silueta(:,9),2);
    norma{10}=norm(silueta(:,10),2);
    norma{11}=norm(silueta(:,11),2);
    norma{12}=norm(silueta(:,12),2);

fprintf(1,'OK\n\n');
fprintf(1, '-->Calculant els vectors unitaris dels vectors distancia......'); 
%Fem el unitari
    unitari1=silueta(:,1)/norma{1};
    unitari2=silueta(:,2)/norma{2};
    unitari3=silueta(:,3)/norma{3};
    unitari4=silueta(:,4)/norma{4};
    unitari5=silueta(:,5)/norma{5};
    unitari6=silueta(:,6)/norma{6};
    unitari7=silueta(:,7)/norma{7};
    unitari8=silueta(:,8)/norma{8};
    unitari9=silueta(:,9)/norma{9};
    unitari10=silueta(:,10)/norma{10};
    unitari11=silueta(:,11)/norma{11};
    unitari12=silueta(:,12)/norma{12};
    
fprintf(1,'OK\n\n');
fprintf(1, '-->Guardant els vectors unitaris..............................'); 
%Guardem els vectors unitaris en una estructura cell
    siluetes(:,1)=unitari1;
    siluetes(:,2)=unitari2;
    siluetes(:,3)=unitari3;
    siluetes(:,4)=unitari4;
    siluetes(:,5)=unitari5;
    siluetes(:,6)=unitari6;
    siluetes(:,7)=unitari7;
    siluetes(:,8)=unitari8;
    siluetes(:,9)=unitari9;
    siluetes(:,10)=unitari10;
    siluetes(:,11)=unitari11;
    siluetes(:,12)=unitari12;

fprintf(1,'OK\n\n');
fprintf(1, '-->Guardant els vectors unitaris..............................');     
save ('siluetes');

fprintf(1,'OK\n\n');
    