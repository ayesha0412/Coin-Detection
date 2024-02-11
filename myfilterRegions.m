function [coin1,rup1,rup2] = myfilterRegions(in_img)
%==========Code By: Usman Sheikh ==================%
%==========www.tutorialhunk.com====================%
% It will count number of different coins in a grayscale image
% and places their respective annotations on each detected object
%---------------------------------------------------------
coin1 = imread(in_img);
BW_in = im2bw(coin1);
BW_in = imfill(BW_in,'holes');
BW_out = BW_in;

% Get properties.
prop = regionprops(BW_in, {'Area', 'Centroid'});

% the following line is to return the properties in a table.
prop = struct2table(prop);

figure(1);imshow(coin1);
rup1 = 0;
rup2 = 0;
for i=1:numel(prop.Area(:,1))
    if prop.Area(i)<1900
        coin1 = insertShape(coin1,'circle',[prop.Centroid(i,1) prop.Centroid(i,2) 25],'LineWidth',5);
        coin1 = insertText(coin1, [prop.Centroid(i,1)-20 prop.Centroid(i,2)-10],'1 PKR','BoxOpacity',0.0,'TextColor','blue','FontSize',14);
        rup1 = rup1+1;
    else
        coin1 = insertShape(coin1,'circle',[prop.Centroid(i,1) prop.Centroid(i,2) 30],'LineWidth',5,'color','green');
        coin1 = insertText(coin1, [prop.Centroid(i,1)-20 prop.Centroid(i,2)-10],'2 PKR','BoxOpacity',0.0,'TextColor','red','FontSize',16);
        rup2 = rup2+1;
    end
    imshow(coin1);
    title(['Coin 1 = ',num2str(rup1), '    Coin 2 = ', num2str(rup2)]);
    pause(2);
end
rup1
rup2
end