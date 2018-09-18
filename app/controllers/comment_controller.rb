class CommentController < ApplicationController
    def mtm_create
        c = Comment.new
        c.post_id = params[:num]
        c.comment_writer = params[:commentor]
        c.comment_content = params[:comment_content]
        c.save
        
        redirect_to "/mtm_read/#{c.post_id}"
    end
    
    def mtm_delete
        Comment.find(params[:c_id]).destroy
       
        redirect_to "/mtm_read/#{params[:p_id]}"
    end

end
