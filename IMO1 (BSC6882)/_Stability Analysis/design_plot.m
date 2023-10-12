% make pretty plots:
function design_plot(xtext,ytext)
    size = 600; hold on;
    set(findobj(gcf,'type','axes'),'FontName','Arial','FontSize',20,'FontWeight','Bold', 'LineWidth', 2);
    p = get(gcf,'Position');
    set(gcf,'Position',[p(1),p(2),size,size]);
    box on;
    set(gcf,'color',[1,1,0.9725]);
    set(gca,'color',[1,1,0.9725]);


    xlabel(xtext);
    ylabel(ytext);
end
