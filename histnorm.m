% This is a code forked from Livan and his co-workers, its function is
% similar to "hist"
function varargout = histnorm(varargin)
doPlot = 0;

if ischar (varargin{end}) && strcmpi ('plot', varargin{end})

    doPlot = 1;

    varargin = varargin(1:end-1);

elseif nargout == 0

    doPlot = 1;    

end
[xo,no] = hist (varargin{:});

binwidths = diff ([min(varargin{1}) no(1:end-1)+diff(no)/2 max(varargin{1})]);

xonorm = xo/sum (xo .* binwidths);

varargout = {xonorm, no};

varargout = varargout(1:nargout);

if doPlot

    cax = axescheck(varargin{:});

    hist (varargin{:});

    if isempty (cax)

        cax = gca;

    end

    ch = findobj (get (cax, 'children'), 'type', 'patch'); ch = ch(1);

    vertices = get (ch, 'vertices');

    for idx = 1:numel (xonorm)

        vertices((idx-1)*5+[3 4],2) = xonorm(idx); 

    end

    set (ch, 'vertices', vertices);

end
