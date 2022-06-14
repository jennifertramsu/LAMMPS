function Al_eq

% import
fname = 'Al_eq.txt';
A = importdata(fname);
time = A.data(:,1);
boxSide = A.data(:,2:4);
vol = A.data(:,5);
press = A.data(:,6);
pe = A.data(:,7);
ke = A.data(:,8);
te = A.data(:,9);
temp = A.data(:,10);

% plot
lwidth=2;
msize=5;
fsize=18;

scnsz = get(0,'ScreenSize');

figure('Position',[0 0 scnsz(3) scnsz(4)]);

subplot(2,2,1);
plot(time,boxSide(:,1),'-or','LineWidth',lwidth,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',msize);
xlim([0 24]);
set(gca,'XTick',[0:4:24]);
set(gca,'FontSize',fsize);
set(get(gca,'XLabel'),'String','time / ps','FontSize',fsize);
set(get(gca,'YLabel'),'String','box side / Angstroms','FontSize',fsize);

subplot(2,2,2);
plot(time,press,'-ob','LineWidth',lwidth,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',msize);
xlim([0 24]);
set(gca,'XTick',[0:4:24]);
set(gca,'FontSize',fsize);
set(get(gca,'XLabel'),'String','time / ps','FontSize',fsize);
set(get(gca,'YLabel'),'String','pressure / bar','FontSize',fsize);

subplot(2,2,3);
plot(time,temp,'-og','LineWidth',lwidth,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',msize);
xlim([0 24]);
set(gca,'XTick',[0:4:24]);
set(gca,'FontSize',fsize);
set(get(gca,'XLabel'),'String','time / ps','FontSize',fsize);
set(get(gca,'YLabel'),'String','T / K','FontSize',fsize);

subplot(2,2,4);
hold on
plot(time,pe,'-ob','LineWidth',lwidth,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',msize);
plot(time,ke,'-or','LineWidth',lwidth,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',msize);
plot(time,te,'-og','LineWidth',lwidth,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',msize);
hold off
xlim([0 24]);
set(gca,'XTick',[0:4:24]);
set(gca,'FontSize',fsize);
set(get(gca,'XLabel'),'String','time / ps','FontSize',fsize);
set(get(gca,'YLabel'),'String','energy / eV','FontSize',fsize);
legend({'PE','KE','E'},'FontSize',fsize,'Location','EastOutside');

set(gcf,'color','w');

% save
saveas(gcf,strrep(fname,'txt','fig'),'fig')
saveas(gcf,strrep(fname,'txt','tif'),'tif')

