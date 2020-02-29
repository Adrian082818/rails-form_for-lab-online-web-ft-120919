class StudentsController < ApplicationController


    def index 
        @students = Student.all 
    end 

    def show 
        @student = Student.find(params[:id])
    end 

    def new 
    end 

    def create 
        @student = Student.new(student_params(:first_name, :last_name))
        @student.save
        redirect_to student_path(@student)
    end 

    def edit 
        @student = Student.find(params[:id])
    end 

    def update 
        @student = Student.find(params[:id])
        @student.update(student_params(:first_name))
        redirect_to student_path(@student)
    end 

    private

    def student_params(*arg)
        params.require(:student).permit(*arg)
    end     
end 