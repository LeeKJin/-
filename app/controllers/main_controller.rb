class MainController < ApplicationController
  before_action :authenticate_user!, only: [:self1, :mtm, :history]
  load_and_authorize_resource
  
  def index
  end
  
  def mtm
    @posts = Post.all  
    @posts = Post.order("created_at DESC").page params[:page] 
  end

  def mtm_write
  end

  def mtm_read
    @find_post = Post.find(params[:num])
    begin
      authorize! :read, @find_post
    rescue Exception
      redirect_to "/warning"
    end
   
    @comments = Comment.where(post_id: params[:num])
  end 
  def mtm_write_action
    @p = Post.new 
    @p.title = params[:subject]
    @p.writer = params[:author]
    @p.content = params[:object]
    @p.user_id = current_user.id
    @p.save
    
    redirect_to '/mtm'
  end
  
  def mtm_delete
    delete_post = Post.find(params[:num])
    authorize! :destroy, delete_post
    delete_post.destroy
    
    redirect_to '/mtm'
  end
  
  def mtm_update
    @update_post = Post.find(params[:num])
    authorize! :update, @update_post
  end
  
  def mtm_update_action
    @update_post = Post.find(params[:num])
    
    @update_post.title = params[:subject]
    @update_post.writer = params[:author]
    @update_post.content = params[:object]
    @update_post.save
    
    redirect_to '/mtm'
  end
  
  def self1

  end
  
  def self_action
    @id=params[:id]
    @gender=params[:gender]
    @age=params[:age]
    @drink=params[:drink]
    @smoke=params[:smoke]
    @sleeptime=params[:sleeptime]
    
    @currentQ = QuestionId.create(age: @age, drink_frequency: @drink, smoke: @smoke)
    
    redirect_to "/self2?id=#{@currentQ.id}"
  end
  
  
  def self2
     @currentQ = QuestionId.find(params[:id])
    
  end
  
  def self3
    @currentQ = QuestionId.find(params[:id])
    @currentQ.shape = params[:type]
    
    @currentQ.save
  end
  
  def self_result_action
    @currentQ = QuestionId.find(params[:id])
    @currentQ.color = params[:c]
    
    @currentQ.save
    
    @q = QuestionResult.create(question_id: params[:id])
    # q.question_id = params[:id]
    if @currentQ.shape == 1 
      @q.shape = '변비를 해결하고 싶다면 먼저 식사량과 수분 섭취량을 늘리세요. 식사량을 늘리기 위해 밥만 많이 먹다가는 변비가 더 심해질 수 있습니다. 시금치 등 섬유질이 풍부한 식단을 짜야 효과가 있습니다. 또 운동량을 늘리세요. 변비를 유발하는 스트레스까지 더불어 해결됩니다. 그래도 호전이 없다고요? 그렇다면 다른 질환일 수 있습니다. 서행성 변비유형, 골반저근소실증, 대장종양, 장폐색, 갑상선기능저하증 같은 대사성이상 등 기질적 질환일 수 있으니 병원을 찾아 보세요.'
    
    elsif @currentQ.shape == 2
      @q.shape = '변비를 해결하고 싶다면 먼저 식사량과 수분 섭취량을 늘리세요. 식사량을 늘리기 위해 밥만 많이 먹다가는 변비가 더 심해질 수 있습니다. 시금치 등 섬유질이 풍부한 식단을 짜야 효과가 있답니다. 또 운동량을 늘리세요. 변비를 유발하는 스트레스까지 더불어 해결됩니다. 그래도 호전이 없다고요? 그렇다면 다른 질환일 수 있습니다. 서행성 변비유형, 골반저근소실증, 대장종양, 장폐색, 갑상선기능저하증 같은 대사성이상 등 기질적 질환일 수 있으니 병원을 찾아 보세요.'
    
    elsif @currentQ.shape == 3 
      @q.shape = '정상적인 변의 모양입니다!'
    
    elsif @currentQ.shape == 4
      @q.shape = '정상적인 변의 모양입니다!'
      
    elsif @currentQ.shape == 5 
      @q.shape = '배가 심하게 아프거나, 38.5℃이상의 고열로 힘들거나, 이틀이 넘도록 쉬지 않고 계속 설사를 한다면 모두 병원을 찾아야 하는 증상이에요. 설사는 대개 지나치게 많은 섬유질 섭취, 심한 스트레스, 상한 음식 섭취, 위장의 염증, 불결한 위생관리로 병균이 우리 몸에 들어온 전염성인 경우가 많아요. 따라서 외출후나 식사전에는 항상 손을 깨끗하게 씻고 급성 설사 증세를 보인다면 끓여서 식힌 물과 죽, 미음을 먹으면서 배를 따뜻하게 합니다.'
    
    elsif @currentQ.shape == 6 
      @q.shape = '배가 심하게 아프거나, 38.5℃이상의 고열로 힘들거나, 이틀이 넘도록 쉬지 않고 계속 설사를 한다면 모두 병원을 찾아야 하는 증상이에요. 설사는 대개 지나치게 많은 섬유질 섭취, 심한 스트레스, 상한 음식 섭취, 위장의 염증, 불결한 위생관리로 병균이 우리 몸에 들어온 전염성인 경우가 많아요. 따라서 외출후나 식사전에는 항상 손을 깨끗하게 씻고 급성 설사 증세를 보인다면 끓여서 식힌 물과 죽, 미음을 먹으면서 배를 따뜻하게 합니다.'
  
    elsif @currentQ.shape == 7
      @q.shape = '배가 심하게 아프거나, 38.5℃이상의 고열로 힘들거나, 이틀이 넘도록 쉬지 않고 계속 설사를 한다면 모두 병원을 찾아야 하는 증상이에요. 설사는 대개 지나치게 많은 섬유질 섭취, 심한 스트레스, 상한 음식 섭취, 위장의 염증, 불결한 위생관리로 병균이 우리 몸에 들어온 전염성인 경우가 많아요. 따라서 외출후나 식사전에는 항상 손을 깨끗하게 씻고 급성 설사 증세를 보인다면 끓여서 식힌 물과 죽, 미음을 먹으면서 배를 따뜻하게 합니다.'
    end
    
    if @currentQ.color == "1"
      @q.color = '매우 정상적인 변의 색깔입니다!'
    
    elsif @currentQ.color == "2"
      @q.color = '변이 검고 끈끈하면 식도, 위, 십이지장 출혈을 의심해 볼 수 있습니다. 혈액이 위를 통과할 때 위산과 반응하여 검게 변하면서 변 색깔까지 검게 만들기 때문입니다. 평소 속이 자주 쓰리고 소화가 안되며 이런 검은 변을 본다면 소화성궤양에 의한 출혈이나 위염, 위암 등에 의한 출혈일 가능성이 높습니다!'
    
    elsif @currentQ.color == "3"
      @q.color = '대변에서 나타나는 선홍색의 피는 항문이나 직장, 하부대장의 출혈일 수 있습니다. 특히 치질이면 변기 물이 빨개질 정도로 많은 피가 나오며, 대장 위쪽에 출혈이 있으면 변이 검붉은색을 띱니다.'
      
    elsif @currentQ.color == "4"
      @q.color = '대변의 담즙 부족으로 발생할 수 있습니다. 여러가지 질환이나 이유로 담즙이 감소하면 변의 색깔이 흰색을 띄어갑니다. 담즙 감소(또는 담도폐쇄)는 담낭염, 담석, 특정 기생충 감염, 간염, 만성췌장염, 간경변 등이 있을 경우 생길 수 있습니다. 또한 제산제나 소화되지 못한 기름성분 때문에 변의 색이 흰색에 가깝게 변할 수 있습니다.'
      
    elsif @currentQ.color == "5" 
      @q.color = '간에서 만들어진 담즙은 십이지장(소장)에서 분비됩니다. 변은 소장에서 대장으로 내려가며 담즙이 흡수되어 녹색이었다가 점차 노란색 갈색으로 변하게 됩니다. 하지만 대장 톨과 시간이 어떤 원인으로 빨라기제 되면 설사나 녹색의 대변이 나오게 됩니다. 하지만 녹색 대변이라고 건강에 이상이 있다는 것은 아닙니다. 녹색 채소를 많이 복용할 경우 엽록소라는 색소때문에 녹색변을 볼 수도 있습니다.'
    
    elsif @currentQ.color == "6"
      @q.color = '변의 색깔이 지속적으로 특이한 밝은 노란색이라면 쓸개가 막혀서 담즙이 덜 나온다는 것입니다. 췌장염이나 지방질 소화가 안될 경우, 지독한 냄새와 함께 이런 똥이 나옵니다. 또는 장내 편모충 같은 기생충으로 인해 노란변을 볼 수 있습니다.'
    end
    
    @q.save
    
    redirect_to "/self_result?id=#{@currentQ.id}"
  end
  
  def self_result
    @q = QuestionResult.find(params[:id])
    
    
  end
  
  def history_action
    @m = History.new
    @m.user_id = current_user.id
    @m.history_q_ID = params[:q_id]
    @m.h_result = params[:shape]
    
    @m.save
    
    redirect_to "/history"
  end
  
  def history
    @m = History.where(user_id: current_user.id)
    
    
    
  end
  
  def warning
    
  end
  
  
end
