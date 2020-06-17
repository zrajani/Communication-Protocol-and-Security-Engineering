r= input('Radius of the circle whose area has to be calculated: ');
Area = circle(r);
final_display='Area of the circle is: %0.5f';
Area_s=sprintf(final_display,Area);
disp(Area_s);