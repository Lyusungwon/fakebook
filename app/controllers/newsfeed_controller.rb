class NewsfeedController < ApplicationController
@@owner = ""
@@ip = ""
@@default_profile = "https://heatherchristenaschmidt.files.wordpress.com/2011/09/facebook_no_profile_pic2-jpg.gif"
@@default_cover = "http://cfs8.blog.daum.net/image/25/blog/2009/04/20/01/14/49eb4d8656a3a&filename=035.jpg"   
    def index
        @user_num = User.count
        if user_signed_in?
        redirect_to "/newsfeed/main"
        end
    end
    def main
        @@ip = request.remote_ip
    end 
    def write
        img_samples = ['http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/001_001.png', 'http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/002_002.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/003_003.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/010_007.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/011_008.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/012_009_01.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/005_004.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/006_005.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/007_006_01.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/014_010.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/015_011.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/016_012.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/017_013.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/018_014.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/019_015_01.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/020_016.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/021_017.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/022_018_01.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/023_019.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/024_020.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/025_021.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/026_022.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/027_023.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/028_024.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/029_025.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/030_026.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/031_027.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/032_028.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/033_029.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/034_030.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/035_031.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/036_032.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/037_033.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/038_034.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/039_035.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/040_036.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/041_037.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/042_038.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/043_039.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/044_040.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/045_041.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/046_042.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/047_043.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/048_044.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/049_045.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/050_046.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/051_047.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/052_048.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/053_049.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/054_050.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/055_051.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/056_052.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/057_053.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/058_054.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/059_055.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/060_056.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/061_057.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/062_058.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/063_059.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/064_060.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/065_061.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/066_062.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/067_063.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/068_064.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/069_065_01.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/071_066.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/072_067.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/072_067.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/073_068.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/074_069.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/075_070.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/076_071.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/077_072.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/078_073.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/079_074.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/080_075.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/081_076.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/082_077.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/083_078.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/084_079.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/085_080_01.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/086_081.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/087_082.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/088_083.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/089_084.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/090_085.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/091_086.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/092_087.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/093_088.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/094_089.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/095_090.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/096_091.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/097_092.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/098_093.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/099_094_01.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/101_095.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/102_096.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/103_097.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/104_098.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/105_099.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/106_100.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/107_101.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/108_102.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/110_104.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/111_105.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/112_106.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/113_107.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/114_108.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/115_109.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/116_110.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/117_111.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/118_112.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/119_113.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/120_114.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/121_115_01.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/123_116.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/124_117.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/125_118.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/126_119.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/127_120.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/128_121.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/129_122.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/130_123.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/131_124.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/132_125.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/133_126.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/134_127_01.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/136_128.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/137_129.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/138_130_01.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/140_131.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/141_132.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/142_133.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/143_134.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/144_135.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/145_136.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/146_137.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/147_138.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/148_139.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/149_140.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/150_141.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/151_142_01.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/153_143.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/154_144.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/155_145.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/156_146.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/157_147.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/158_148.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/159_149.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/160_150_01.png','http://pokedex.pokemonkorea.co.kr/templates/default/images/MonImages/middle/163_151.png']
        unless (params[:content].nil?)
            if user_signed_in? 
                posts=Post.new
                posts.writer_id = current_user.id
                posts.nickname = current_user.lastname+current_user.firstname
                posts.password = current_user.encrypted_password
                posts.img = current_user.profile_image
            else
                posts=Post.new
                posts.nickname = params[:name]
                posts.password = params[:password]
                posts.img = img_samples.sample
                posts.ip = @@ip
            end
            posts.content = params[:content]
            unless params[:imgfile].nil?
                image = MiniMagick::Image.new(params[:imgfile].path)
                image.resize "450x450"
                posts.imgfile = image
            end
            posts.save
            redirect_to :back  
        else
            redirect_to :back  
        end
    end
    def delete
        @one_post = Post.find(params[:id])
        pass = @one_post.password
        inputpass = params[:input_password].to_s
        if pass == inputpass
        @one_post.destroy
        redirect_to "/newsfeed/main"
        end
    end
    def delete_process
        @one_post = Post.find(params[:id])
        @one_post.destroy
        redirect_to "/newsfeed/main"
    end
    def update
        @one_post = Post.find(params[:id])
        pass = @one_post.password
        inputpass = params[:input_password].to_s
        if pass == inputpass
        @one_post.nickname = params[:new_name]
        @one_post.content = params[:new_content]
        @one_post.save
        redirect_to "/newsfeed/main"
        end
    end
    def update2
        @one_post = Post.find(params[:id])
    end
    def update_process
        @one_post = Post.find(params[:id])
        @one_post.content = params[:new_content]
        @one_post.save
        redirect_to "/newsfeed/main"
    end
    def like_post
        if Like.where(:post_id => params[:id], :user_id => current_user.id).empty?
        one_post = Like.new
        one_post.post_id = params[:id]
        one_post.user_id = current_user.id
        one_post.like = true
        one_post.save
        end
        redirect_to :back
    end
    def like_post_cancel
        posts = Like.where(:post_id => params[:id], :user_id => current_user.id).take.id
        @one_post = Like.find(posts)
        @one_post.destroy
        redirect_to :back
    end    
    def like_reply
        if Like.where(:reply_id => params[:id], :user_id => current_user.id).empty?
        one_reply = Like.new
        one_reply.reply_id = params[:id]
        one_reply.user_id = current_user.id
        one_reply.like = true
        one_reply.save
        end
        redirect_to :back
    end    
    def like_reply_cancel
        replies = Like.where(:reply_id => params[:id], :user_id => current_user.id).take.id
        @one_reply = Like.find(replies)
        @one_reply.destroy
        redirect_to :back
    end    
    def reply
        @job_list = {
        "갬블러" => "http://vignette1.wikia.nocookie.net/pokemon/images/9/9a/1%EC%84%B8%EB%8C%80_%EA%B0%AC%EB%B8%94%EB%9F%AC.png/revision/latest?cb=20110802165237&path-prefix=ko",
        "곤충채집소년" => "http://vignette2.wikia.nocookie.net/pokemon/images/7/7f/1%EC%84%B8%EB%8C%80_%EA%B3%A4%EC%B6%A9%EC%B1%84%EC%A7%91_%EC%86%8C%EB%85%84.png/revision/latest?cb=20110402142722&path-prefix=ko",
        "괴짜 연구원" => "http://vignette1.wikia.nocookie.net/pokemon/images/7/72/1%EC%84%B8%EB%8C%80_%EC%97%B0%EA%B5%AC%EC%9B%90_%EB%82%A8.png/revision/latest?cb=20111218104801&path-prefix=ko",
        "기도사" => "http://vignette2.wikia.nocookie.net/pokemon/images/7/76/1%EC%84%B8%EB%8C%80_%EA%B8%B0%EB%8F%84%EC%82%AC.png/revision/latest?cb=20111216145904&path-prefix=ko",
        "낚시꾼" => "http://vignette2.wikia.nocookie.net/pokemon/images/0/0d/1%EC%84%B8%EB%8C%80_%EB%82%9A%EC%8B%9C%EA%BE%BC.png/revision/latest?cb=20110806100826&path-prefix=ko", 
        "등산가" => "http://vignette4.wikia.nocookie.net/pokemon/images/f/fa/1%EC%84%B8%EB%8C%80_%EB%93%B1%EC%82%B0%EA%B0%80.png/revision/latest?cb=20110729130524&path-prefix=ko", 
        "로켓단 조무래기(남)" => "http://vignette1.wikia.nocookie.net/pokemon/images/1/13/GSC_%EB%A1%9C%EC%BC%93%EB%8B%A8_%EC%A1%B0%EB%AC%B4%EB%9E%98%EA%B8%B0_%EB%82%A8.png/revision/latest?cb=20120216060556&path-prefix=ko", 
        "로켓단 조무래기(여)" => "http://vignette4.wikia.nocookie.net/pokemon/images/c/cd/GSC_%EB%A1%9C%EC%BC%93%EB%8B%A8_%EC%A1%B0%EB%AC%B4%EB%9E%98%EA%B8%B0_%EC%97%AC.png/revision/latest?cb=20120216051342&path-prefix=ko",
        "맹수조련사" => "http://vignette1.wikia.nocookie.net/pokemon/images/9/9a/1%EC%84%B8%EB%8C%80_%EB%A7%B9%EC%88%98%EC%A1%B0%EB%A0%A8%EC%82%AC.png/revision/latest?cb=20111217090916&path-prefix=ko", 
        "로켓단 보스" => "http://vignette4.wikia.nocookie.net/pokemon/images/1/11/%EB%8F%84%ED%8A%B8_%EC%A0%81%EB%85%B9_%EB%B9%84%EC%A3%BC%EA%B8%B0.png/revision/latest?cb=20110110211723&path-prefix=ko",
        "반바지 꼬마" => "http://vignette3.wikia.nocookie.net/pokemon/images/e/e8/1%EC%84%B8%EB%8C%80_%EB%B0%98%EB%B0%94%EC%A7%80_%EA%BC%AC%EB%A7%88.png/revision/latest?cb=20110501080029&path-prefix=ko", 
        "불난집 전문털이범" => "http://vignette1.wikia.nocookie.net/pokemon/images/7/7e/RGBY_%EB%B6%88%EB%82%9C%EC%A7%91_%EC%A0%84%EB%AC%B8%ED%84%B8%EC%9D%B4%EB%B2%94.png/revision/latest?cb=20111001143345&path-prefix=ko",
        "빡빡이" => "http://vignette3.wikia.nocookie.net/pokemon/images/a/a7/1%EC%84%B8%EB%8C%80_%EB%B9%A1%EB%B9%A1%EC%9D%B4.png/revision/latest?cb=20110808122422&path-prefix=ko",
        "새 조련사" => "http://vignette3.wikia.nocookie.net/pokemon/images/d/d4/1%EC%84%B8%EB%8C%80_%EC%83%88_%EC%A1%B0%EB%A0%A8%EC%82%AC.png/revision/latest?cb=20110806163755&path-prefix=ko", 
        "선원" => "http://vignette1.wikia.nocookie.net/pokemon/images/e/e7/1%EC%84%B8%EB%8C%80_%EC%84%A0%EC%9B%90.png/revision/latest?cb=20110830125702&path-prefix=ko", 
        "수리공" => "http://vignette1.wikia.nocookie.net/pokemon/images/0/09/1%EC%84%B8%EB%8C%80_%EC%88%98%EB%A6%AC%EA%B3%B5.png/revision/latest?cb=20110805100545&path-prefix=ko", 
        "수영팬티 소년" => "http://vignette1.wikia.nocookie.net/pokemon/images/f/f7/RGB_%EC%88%98%EC%98%81%ED%8C%AC%ED%8B%B0_%EC%86%8C%EB%85%84.png/revision/latest?cb=20111106065058&path-prefix=ko",
        "신사" => "http://vignette4.wikia.nocookie.net/pokemon/images/c/c2/1%EC%84%B8%EB%8C%80_%EC%8B%A0%EC%82%AC.png/revision/latest?cb=20110830125701&path-prefix=ko",
        "아가씨" => "http://vignette4.wikia.nocookie.net/pokemon/images/a/a6/2%EC%84%B8%EB%8C%80_%EC%8C%8D%EB%91%A5%EC%9D%B4.png/revision/latest?cb=20110825153327&path-prefix=ko", 
        "엘리트 트레이너(남)" => "http://vignette2.wikia.nocookie.net/pokemon/images/2/24/1%EC%84%B8%EB%8C%80_%EC%97%98%EB%A6%AC%ED%8A%B8_%ED%8A%B8%EB%A0%88%EC%9D%B4%EB%84%88_%EB%82%A8.png/revision/latest?cb=20110424040731&path-prefix=ko",
        "엘리트 트레이너(여)" => "http://vignette1.wikia.nocookie.net/pokemon/images/7/78/1%EC%84%B8%EB%8C%80_%EC%97%98%EB%A6%AC%ED%8A%B8_%ED%8A%B8%EB%A0%88%EC%9D%B4%EB%84%88_%EC%97%AC.png/revision/latest?cb=20110424040735&path-prefix=ko", 
        "이과계의 남자" => "http://vignette3.wikia.nocookie.net/pokemon/images/e/e6/1%EC%84%B8%EB%8C%80_%EC%9D%B4%EA%B3%BC%EA%B3%84%EC%9D%98_%EB%82%A8%EC%9E%90.png/revision/latest?cb=20111213154254&path-prefix=ko", 
        "저글러" => "http://vignette4.wikia.nocookie.net/pokemon/images/6/66/1%EC%84%B8%EB%8C%80_%EC%A0%80%EA%B8%80%EB%9F%AC.png/revision/latest?cb=20110822131116&path-prefix=ko", 
        "전기그룹" => "http://vignette3.wikia.nocookie.net/pokemon/images/d/d0/1%EC%84%B8%EB%8C%80_%EC%A0%84%EA%B8%B0%EA%B7%B8%EB%A3%B9.png/revision/latest?cb=20110806100828&path-prefix=ko", 
        "짧은 치마" => "http://vignette4.wikia.nocookie.net/pokemon/images/2/2c/1%EC%84%B8%EB%8C%80_%EC%A7%A7%EC%9D%80_%EC%B9%98%EB%A7%88.png/revision/latest?cb=20110402142723&path-prefix=ko", 
        "초능력자" => "http://vignette1.wikia.nocookie.net/pokemon/images/0/07/RGB_%EC%B4%88%EB%8A%A5%EB%A0%A5%EC%9E%90.png/revision/latest?cb=20111016145433&path-prefix=ko",
        "캠프보이" => "http://vignette4.wikia.nocookie.net/pokemon/images/f/fd/1%EC%84%B8%EB%8C%80_%EC%BA%A0%ED%94%84%EB%B3%B4%EC%9D%B4.png/revision/latest?cb=20110802080430&path-prefix=ko", 
        "태권왕" => "http://vignette2.wikia.nocookie.net/pokemon/images/f/fc/1%EC%84%B8%EB%8C%80_%ED%83%9C%EA%B6%8C%EC%99%95.png/revision/latest?cb=20110826132109&path-prefix=ko",
        "포켓몬 매니아" => "http://vignette3.wikia.nocookie.net/pokemon/images/3/33/1%EC%84%B8%EB%8C%80_%ED%8F%AC%EC%BC%93%EB%AA%AC_%EB%A7%A4%EB%8B%88%EC%95%84.png/revision/latest?cb=20110804140642&path-prefix=ko",
        "폭주족" => "http://vignette4.wikia.nocookie.net/pokemon/images/3/34/1%EC%84%B8%EB%8C%80_%ED%8F%AD%EC%A3%BC%EC%A1%B1.png/revision/latest?cb=20110806163756&path-prefix=ko",
        "피크닉걸" => "http://vignette4.wikia.nocookie.net/pokemon/images/f/ff/1%EC%84%B8%EB%8C%80_%ED%94%BC%ED%81%AC%EB%8B%89%EA%B1%B8.png/revision/latest?cb=20110802080431&path-prefix=ko"
        }
        @job = @job_list.keys.sample
        age = (18..55).to_a
        
        if user_signed_in? 
            reply = Reply.new
            reply.post_id = params[:post_id]
            reply.user_id = current_user.id
            reply.content = params[:reply]
            reply.img = current_user.profile_image
            reply.job = current_user.lastname+current_user.firstname
            reply.ip = @@ip
            reply.save        
            redirect_to :back 
        else
            reply = Reply.new
            reply.post_id = params[:post_id]
            reply.content = params[:reply]
            reply.img = @job_list[@job]
            reply.job = @job+" "+age.sample.to_s+"세"
            reply.ip = @@ip
            reply.save        
        redirect_to :back 
        end    
    end
    def reply_delete
        one_post = Reply.find(params[:id])
      	one_post.destroy
        redirect_to :back 
    end
    def email_send
        cc = params[:mail_cc]
        from = params[:mail_from]
        title = params[:mail_title]
        content = params[:mail_content]
        Report.letter(cc, from, title, content).deliver_now
        redirect_to :back 
    end
    def ownpage
        @@owner = params[:id]
    end
    def write_own
        unless (params[:content].nil?)
            posts=Post.new
            posts.receiver_id = @@owner
            posts.writer_id = current_user.id
            posts.nickname = current_user.lastname+current_user.firstname
            posts.password = current_user.password
            posts.img = current_user.profile_image
            posts.content = params[:content]
            unless params[:imgfile].nil?
                image = MiniMagick::Image.new(params[:imgfile].path)
                image.resize "450x450"
                posttos.imgfile = image
            end
            posts.save
            redirect_to :back  
        else
            redirect_to :back 
        end
    end    
    def friendslist
    end
    def search
    end
end
