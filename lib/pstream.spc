pstream = cluster is primary_output, create, start, stop, pause,
		     text, textc, putleft, putright, putspace,
		     get_indent, set_indent,
		     get_depth, get_hpos,
		     get_max_depth, set_max_depth,
		     get_max_width, set_max_width,
		     get_flat, set_flat, get_wrap, set_wrap,
		     get_line_length, get_page_length,
		     equal, reset, print

rep = any

% Note: text containing tabs or newlines should not be used.

primary_output = proc () returns (pstream)
	% Returns print stream to primary output.
	% Initial max width and depth = 4.
	end primary_output

create = proc (st: stream, max_depth: int, max_width: int)
				returns (cvt) signals (illegal_stream)
	% Create a print stream to the given stream.
	end create

get_depth = proc (x: cvt) returns (int)
	% Returns current depth.
	end get_depth

get_hpos = proc (x: cvt) returns (int)
	% Returns current horizontal position.
	end get_hpos

start = proc (ps: cvt, s: string) returns (bool)
	% Output the string (if not in the abort state), and start
	% a new level with indentation set at new horizontal position.
	% If the new level exceeds the maximum depth, "..." is
	% output and the abort state is entered.
	% Returns true if in the abort state.
	end start

stop = proc (ps: cvt, s: string) returns (bool)
	% Pop out a level, resetting to previous indentation.
	% If no longer beyond the maximum depth, exit the abort state.
	% Output the string (if not in the abort state).
	% Returns true if in the abort state.
	end stop

pause = proc (ps: cvt, s: string) returns (bool)
	% Do nothing if in the abort state.
	% Output the string.
	% If printing flat, output a space; otherwise, output a newline
	% and spaces over to the current indentation.
	% Increase the width of the current level by one.
	% If the maximum width is exceeded, output "..." and
	% enter the abort state.
	% Returns true if in the abort state.
	end pause

text = proc (ps: cvt, s: string) returns (bool)
	% Output the string if not in the abort state.
	% Returns true if in the abort state.
	end text

textc = proc (ps: cvt, c: char) returns (bool)
	% Output the char if not in the abort state.
	% Returns true if in the abort state.
	end textc

putleft = proc (ps: pstream, s: string, size: int) returns (bool)
						signals (negative_field_width)
	% Output like stream$putleft if not in the abort state.
	% Returns true if in the abort state.
	end putleft

putright = proc (ps: pstream, s: string, size: int) returns (bool)
						signals (negative_field_width)
	% Output like stream$putright if not in the abort state.
	% Returns true if in the abort state.
	end putright

putspace = proc (ps: cvt, len: int) returns (bool)
				    signals (negative_field_width)
	% Output like stream$putspace if not in the abort state.
	% Returns true if in the abort state.
	end putspace

get_indent = proc (ps: cvt) returns (int)
	% Return the current indentation.
	end get_indent

set_indent = proc (ps: cvt, indent: int)
	% Change the current indentation.
	end set_indent

get_max_depth = proc (ps: cvt) returns (int)
	% Return the maximum depth.
	end get_max_depth

set_max_depth = proc (ps: cvt, depth: int)
	% Change the maximum depth.
	end set_max_depth

get_max_width = proc (ps: cvt) returns (int)
	% Return the maximum width.
	end get_max_width

set_max_width = proc (ps: cvt, width: int)
	% Change the maximum width.
	end set_max_width

get_flat = proc (ps: cvt) returns (bool)
	% Return true if printing flat.
	end get_flat

set_flat = proc (ps: cvt, flat: bool)
	% Set whether printing flat.
	end set_flat

get_wrap = proc (ps: cvt) returns (bool)
	% Return true if wrapping at edge of screen.
	end get_wrap

set_wrap = proc (ps: cvt, wrap: bool)
	% Set whether wrapping at edge of screen.
	end set_wrap

get_line_length = proc (ps: cvt) returns (int) signals (no_limit)
	% Returns line length, if any
	end get_line_length

get_page_length = proc (ps: cvt) returns (int) signals (no_limit)
	% Returns page length, if any
	end get_page_length

equal = proc (x, y: cvt) returns (bool)
	end equal

reset = proc (ps: cvt)
	% Pop out of all levels.
	end reset

print = proc (ps1: cvt, ps2: pstream)
	end print

end pstream
