require 'yaml'
YAML::load(<<YAML
---
- set:
   increase step:        5
   border snap:          10
   default gravity:      :center
   urgent dialogs:       true
   honor size hints:     true
   gravity tiling:       true
   click to focus:       false
   skip pointer warp:    false
   skip urgent warp:     false
- style:
   :all:
      :background:       "#fdf6e3"
      :icon:             "#757575"
      :border:           ["#303030",0]
      :margin:           [6,6]
      :padding:          [2,2]
      :font:             "xft:liberation mono:size=12"
   :sublets:
      :foreground:       "#333333"
   :separator:
      :foreground:       "#999999"
      :separator:        ""
   :title:
      :foreground:       "#300030"
      :background:       "#aaaacf"
   :clients:
      :active:           ["#fdf6e3",10]
      :inactive:         ["#657b83",10]
      :margin:           10
   :subtle:
      :padding:          [0,0,0,0]
      :panel:            ["#657b83",10]
      :background:       "#fdf6e3"
      :stipple:          ["#657b83",10]
- sublet:
   :lk_temp:
      :core:             [["/sys/class/hwmon/hwmon0/device/temp1_input"]]
      :sys:              [[]]
   :clock:
      :interval:         1
      :format_string:    "%y.%m.%d %H:%M:%S"
- gravity:
   :top:                 [  0,  0,100, 50]
   :top66:               [  0,  0,100, 66]
   :top33:               [  0,  0,100, 34]

   :left:                [  0,  0, 50,100]
   :left66:              [  0,  0, 66,100]
   :left33:              [  0,  0, 33,100]

   :center:              [  0,  0,100,100]
   :center88:            [  6,  6, 88, 88]

   :right:               [ 50,  0, 50,100]
   :right66:             [ 34,  0, 66,100]
   :right33:             [ 67,  0, 33,100]

   :bottom:              [  0, 50,100, 50]
   :bottom66:            [  0, 34,100, 66]
   :bottom33:            [  0, 67,100, 33]

   :bleft:               [  0, 50, 50, 50]
   :bright:              [ 50, 50, 50, 50]

   :tleft:               [  0,  0, 50, 50]
   :tright:              [ 50,  0, 50, 50]

   :quassel_input:       [  0, 80, 75,100]
   :quassel_chat:        [ 25,  0,100, 66]
   :quassel_monitor:     [  0, 66, 80,100]
   :quassel_channels:    [  0,  0, 25, 50]
   :quassel_users:       [ 75, 50,100,100]
- grab:
   W-S-k:                [top,top66,top33]
   W-S-h:                [left,left66,left33]
   W-S-space:            [center,center88]
   W-S-l:                [right,right66,right33]
   W-S-j:                [bottom,bottom66,bottom33]
   W-S-n:                [bleft]
   W-S-m:                [bright]
   W-S-y:                [tleft]
   W-S-o:                [tright]
   W-grave:              :WindowStick
   W-Right:              :ViewNext
   W-Left:               :ViewPrev
   W-C-r:                :SubtleReload
   W-C-S-r:              :SubtleRestart
   W-C-S-l:              :SubtleQuit
   W-B1:                 :WindowMove
   W-B3:                 :WindowResize
   W-Up:                 :WindowRaise
   W-Down:               :WindowLower
   W-h:                  :WindowLeft
   W-j:                  :WindowDown
   W-k:                  :WindowUp
   W-l:                  :WindowRight
   W-S-x:                :WindowKill
- tag:
   gmrun:
      :match:            "gmrun"
      :urgent:           true
      :sticky:           true
      :float:            true
   twitter:
      :match:            "twitter"
      :gravity:          :left66
   wallet:
      :match:            "wallet"
      :gravity:          :right33
- view:
   desktop:
      :match:            "twitter|wallet"
...
YAML
).each{|section|
   section.each_pair{|section_name,hash|
      hash.each_pair{|name,value|
         case section_name
         when /set/ then set(name.tr(' ','_').to_sym(),value)
         when /gravity/ then gravity(name,value)
         when /style|sublet|tag|view/
            send(section_name.to_sym,name){
               value.each_pair{|method,arg| send(method,*arg) }
            }
         when /grab/
            grab(name,(value.is_a?(Array) ? value.map(&:to_sym) : value.to_sym()))
         end
      }
   }
}
