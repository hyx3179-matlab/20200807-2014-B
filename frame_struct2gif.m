function frame_struct2gif(F,name,fps,leixing)

for ii = 1:length(F)
    I=frame2im(F(ii));
    [I,map]=rgb2ind(I,256);
    if leixing == 0
        if ii == 1
            imwrite(I,map,name,'gif','WriteMode','overwrite','Loopcount',inf,'DelayTime',1/fps);
        else
            imwrite(I,map,name,'gif','WriteMode','append','DelayTime',1/fps);
        end
    else
        imwrite(I,map,['0' int2str(ii) name(1:end-3) 'jpg'])
    end
    
end