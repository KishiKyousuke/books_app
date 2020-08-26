class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  def index
    @reports = Report.all.page(params[:page])
  end

  def show
    @user = @report.user
    @comments = @report.comments
  end

  def new
    @report = Report.new
  end

  def edit
  end

  def create
    @report = current_user.reports.build(report_params)
    @report.author = current_user.name

    if @report.save
      redirect_to @report, notice: t("common.flash.create")
    else
      render :new
    end
  end

  def update
    if @report.update(report_params)
      redirect_to @report, notice: t("common.flash.update")
    else
      render :edit
    end
  end

  def destroy
    @report.destroy
    redirect_to reports_url, notice: t("common.flash.destroy")
  end

  private
    def set_report
      @report = Report.find(params[:id])
    end

    def report_params
      params.require(:report).permit(:title, :date, :study_time, :body)
    end
end
