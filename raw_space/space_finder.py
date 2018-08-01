

"""Naval Fate.

Usage:
  space_finder.py find   --directory=<path>...
  space_finder.py ship <name> move <x> <y> [--speed=<kn>]
  space_finder.py ship shoot <x> <y>
  space_finder.py mine (set|remove) <x> <y> [--moored | --drifting]
  space_finder.py (-h | --help)
  space_finder.py --version

Options:
  -h --help     Show this screen.
  --find        find the space utilized by raw files
  --directory=<path> directory with path
  --version     Show version.
  --speed=<kn>  Speed in knots [default: 10].
  --moored      Moored (anchored) mine.
  --drifting    Drifting mine.

"""

from docopt import docopt
import os,glob

def is_parent_dir(dir):
    if 'jpeg' in dir:
        return dir
    return None


def find_files_without_extension(directory,files_to_exclude,extension):
    files=[]
    os.chdir(directory)
    for file in glob.glob("*."+extension):
        files.append(file.split('.')[0])
    return list( set(files) - set(files_to_exclude))


def get_size(file_list):
    return  sum(list(map(get_file_size,file_list)))/1024/1024/1024;


def get_file_size(file_path):
    return os.path.getsize(file_path)


def directory_finder(directory_path):
    directory_list_to_compare=[];
    if directory_path and len(directory_path) > 0:
        for file in os.walk(directory_path[0]):

            if isinstance(file,tuple):
                for file_list in file:
                    if isinstance(file_list,list) and 'jpeg' in file_list:
                        directory_list_to_compare.append(file[0])



            # directory_name = os.path.join(directory_path, file)
            # print directory_name
            # if file in ['jpeg','jpg']:
            #     directory_list_to_compare.append(directory_name)
            # else:
            #     directory_list_to_compare.append(finder(directory_name))
    return directory_list_to_compare


def my_print(str):
    print str

if __name__ == '__main__':
    arguments = docopt(__doc__, version='Naval Fate 2.0')

    #print(arguments)

    if arguments['find'] :
        directories=  directory_finder(arguments['--directory'])
        files_to_clean=[]
        for directory in directories:
            jpeg_file_list = find_files_without_extension(os.path.join(directory,'jpeg'),[],'jpg')
            raw_file_list = find_files_without_extension(directory, jpeg_file_list, 'CR2')
            file_paths_to_clean = map(lambda file_name: os.path.join(directory, file_name + ".CR2"), raw_file_list)
            print ("%s : %d"%(directory,get_size(file_paths_to_clean)))
            files_to_clean += file_paths_to_clean
            if len(file_paths_to_clean) == 0:
                print ' nothing to clean in '+ directory
        #map(my_print, files_to_clean)






