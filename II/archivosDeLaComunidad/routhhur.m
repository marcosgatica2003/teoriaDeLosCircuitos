#!/usr/bin/octave
function [n, array] = routhhur(z);

  [n_row, n_col] = size(z);

  order = n_col - 1;
  is_even = order - 2*fix(order/2) == 0;

  h = floor((n_col+1)/2); %Ancho de la tabla de Routh

  array = zeros((order+1), h);
  array(1,:) = z(1:2:n_col);

%Construyendo la tabla de Routh, cada dos lineas la ultima columna se hace cero,
%pero para 'orden impares' esto ourre en la tercer linea, para 'orden pares' en la
%segunda linea.

  if (is_even),
    array(2,1:h-1) = z(2:2:n_col);
    k = 3;
  else
    array(2,1:h) =z(2:2:n_col);
    k = 2;
  endif
  
  for (times = (order-2):-1:0)
    y = 1 + order - times;

    if (abs(array(y-1,1)) > 0) %El primer elemento de la fila anterior es 0?
      for (x = 1:h-floor(k/2))
        array(y,x) = ((array(y-1, 1)*array(y-2, x+1)) - (array(y-2, 1)*array(y-1, x+1))) / array(y-1, 1);
      endfor
    else
      for (x = 1:h-floor(k/2))
        array(y,x) = (((eps+array(y-1, 1))*array(y-2, x+1)) - (array(y-2, 1)*array(y-1, x+1))) / (eps+array(y-1, 1));
      endfor    
    endif
  
    if (y < order)
      if (all(abs(array(y,:)) == 0))
        for (x = 1:h-1)
          array(y, x) = array(y-1, x)*(times + 1 - 2 * (x-1));
        endfor
      endif
    endif
    
  endfor

  #Cambios de signo
  n = 0;
  for (y = (2:order+1))
    if ((sign(array(y, 1))) >= 0)
      temp1 = 1;
    else
      temp1 = 0;
    endif
    
    if ((sign(array(y-1, 1))) >= 0)
      temp2 = 1;
    else
      temp2 = 0;
    endif
    
    if (temp1 != temp2)
      n = n + 1;
    endif
  endfor
  

  disp('Raíces de la ecuacion caracteristica:')
  roots(z)
  
  [l_row, m_col] = size(array);

  for l=1:l_row
  fprintf('P%d \t', (l_row-l))
    for m=1:m_col
      fprintf('%6.6f  \t', array(l,m));
    endfor
    fprintf('\n');
  endfor

  disp('                                       ')
  fprintf('Raices a parte real positiva: %d\n', n);
endfunction
  
