f=imread('radiograph1.jpg'); 
imshow(f)
%%

f=f(:,:,1); % 1 canal 
imshow(f);

%%
f=double(f)/255; %%
imshow(f); 

%%
f=imresize(f,0.25); %de original a un 1/4 de la original
figure(1);
subplot(2,2,1);
imshow(f,[]);
subplot(2,2,2);
mesh(f) %3D
%%
h=10*fspecial('gaussian',7,2); 

subplot(2,2,3);
imshow(h,[]);
mesh(h); 

sum(sum(h));

g = conv2(f,h,'same'); % calcula un promedio en el espectro

subplot(2,2,4);
%mesh(g); 
imshow(g,[]);
%%

F=fft2(f,sz(1),sz(2)); 
subplot(2,2,4);
imshow(fftshift(log(abs(F))),[]) 

%%
sz=size(f); %calcula el tamaño de la foto original
f=zeros(sz(1));
f(int16(sz(1)/2),int16(sz(2)/2))=1;%valor en medio de la imagen igual a 1
f(int16(sz(1)/2),int16(sz(2)/3))=1;
f(int16(sz(1)/3),int16(sz(2)/2))=1;
subplot(2,2,2)
imshow(f,[]);

h=fspecial('gaussian',7,2); % 7 pixeles
subplot(2,2,3);
mesh(h);

g = conv2(f,h,'same'); 
subplot(2,2,4)
%imshow(g,[]);
mesh(g);


%%
%funciones senoidales
for(x=1:sz(1))
    for (y=1:sz(2))
        f(y,x)=sin(y*0.5)*sin(x*0.5); 
end
end
subplot(2,2,1);
imshow(f,[]);
%%
F=fft2(f,sz(1),sz(2));
subplot(2,2,2);
imshow(fftshift(log(abs(F))),[])

subplot(2,2,3);
imshow(fftshift((abs(F))),[])