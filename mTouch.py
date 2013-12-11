import os
import re
import subprocess

if __name__ == "__main__":
    cmd = 'synclient -m 100'

    p = subprocess.Popen(cmd, stdout = subprocess.PIPE, stderr = subprocess.STDOUT, shell = True)
    skip = False
    first = True
    start = False
    start_x = 0
    start_y = 0
    diff_x = 0
    diff_y = 0	
    try:
        while True:
            line = p.stdout.readline()
            if not line:
                break
            try:
                tokens = [x for x in re.split('([^0-9\.])+', line.strip()) if x.strip()]
                x, y, fingers = int(tokens[1]), int(tokens[2]), int(tokens[4])
        	if fingers==3:
			if not start:
				start_x = x
				start_y = y
				start = True
		if start and not fingers==3:
			diff_x = x-start_x
			diff_y = y-start_y
			#MODIFY THE NUMBERS BELLOW FOR SENSITIVITY

                        #if diff_y > 800:
                        #        os.system("xdotool key ctrl+alt+Down")
                        #elif diff_y < -800:
                        #        os.system("xdotool key ctrl+alt+Up")

			if diff_x > 250:
			 	#os.system("xdotool key ctrl+alt+Right")
				os.system("xdotool key alt+Right") 	# chrome
                        elif diff_x < 250:
                                #os.system("xdotool key ctrl+alt+Left")
				os.system("xdotool key alt+Left") 	# chrome
			start = False
			start_x = 0
			start_y = 0
			diff_y = 0
			diff_x = 0
            except (IndexError, ValueError):
                pass
    except KeyboardInterrupt:
        pass 
