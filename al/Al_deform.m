function Al_deform

% import
fname = 'Al_deform.txt';
A = importdata(fname);
strain = A.data(:,1);
stress = A.data(:,2:4);

% plot
lwidth=2;
msize=5;
fsize=24;

figure;
hold on
plot(strain,stress(:,1),'-or','LineWidth',lwidth,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',msize);
plot(strain,stress(:,2),'-ob','LineWidth',lwidth,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',msize);
plot(strain,stress(:,3),'-og','LineWidth',lwidth,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',msize);
hold off
ylim([-2 8])
set(gca,'FontSize',fsize)
set(get(gca,'XLabel'),'String','strain / -','FontSize',fsize)
set(get(gca,'YLabel'),'String','stress / GPa','FontSize',fsize)
set(gcf,'color','w');
legend({'p_{xx}','p_{yy}','p_{zz}'},'FontSize',fsize,'Location','NorthEast');

% linear regression x-stress vs. strain
maxStrain = 0.05;
idx = find(strain<maxStrain,1,'last');
y = stress(1:idx,1);
X = [strain(1:idx),ones(size(strain(1:idx)))];
[b,bint,r,rint,stats] = regress(y,X);
fprintf('E / GPa = %.2f (95%% CI: %.2f - %.2f)\n',b(1),bint(1,1),bint(1,2));

hold on
plot(strain(1:idx),polyval(b,strain(1:idx)),'--k','LineWidth',lwidth);
hold off

% save
saveas(gcf,strrep(fname,'txt','fig'),'fig')
saveas(gcf,strrep(fname,'txt','tif'),'tif')


