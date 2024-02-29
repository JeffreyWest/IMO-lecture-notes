function clean()
    width = 600;
    height = 600;

    h = gcf;
    figure_number=h.Number;
    figure(figure_number); hold on;
    %moveup();

    fs = 16; %was 24;
    set(findobj(gcf,'type','axes'),'FontName','Arial','FontSize',fs,'FontWeight','Bold', 'LineWidth', 2);
    
    p = get(gcf,'Position');
    set(gcf,'Position',[p(1),p(2),width,height]);
    box on;
    set(gcf,'color','w');

end