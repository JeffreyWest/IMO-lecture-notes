function [] = addGameMarker(point_x,point_y,color)
    
    relR=point_x(1); % relative fitness of R (x-axis)
    relS=point_y(1); % relative fitness of S (y-axis)
    
    plot(relR,relS,'.','MarkerSize',30,'Color',color)
    errorbarxy(point_x(1),point_y(1),point_x(2),point_y(2),'LineWidth',2,'Color','black');
end