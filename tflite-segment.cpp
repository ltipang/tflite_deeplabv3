#include <iostream>
#include <fstream>
#include "opencv2/core.hpp"
#include "opencv2/highgui.hpp"
#include "opencv2/imgproc.hpp"
#include "ImageSegmentation.h"
#include <chrono>
#include "tflite_segment.h"

using namespace std;
using namespace cv;
using namespace std::chrono;


//#define SEGMENT_WEBCAM

ImageSegmentation g_segmentation = ImageSegmentation("deeplabv3_257_mv_gpu.tflite");


void runSegmentationWithCam() {
	Mat src;
	Mat mask;

	VideoCapture video;
	int deviceId = 0;
	video.open(deviceId, cv::CAP_ANY);
	ImageSegmentation segmentation = ImageSegmentation("deeplabv3_257_mv_gpu.tflite");
	if (!video.isOpened()) 
	{
		cout << "Error opening Camera." << endl;
		return;
	}
	while (true)
	{
		milliseconds ms = duration_cast<milliseconds>(
			system_clock::now().time_since_epoch()
			);
		cout << ms.count()<<endl;
		video >> src;

		segmentation.segmentImage(src,mask);
		imshow("seg",mask);

		if (waitKey(10) == 27)
		{
			cout << "Esc key is pressed by user. Stoppig the video" << endl;
			break;
		}
	}
}

void segmentMat(Mat src, Mat& mask)
{
    int64 tt = getTickCount();
	g_segmentation.segmentImage(src, mask);
	int64 te = getTickCount();
	cout << "time: "<< (double)(te - tt)/getTickFrequency() * 1000 << endl;
}

bool segmentPath(const char *pchSrcPath,const char *pchMaskPath)
{
	bool bRet = true;
	Mat src = imread(pchSrcPath);
	Mat mask;
	segmentMat(src, mask);
	if (mask.empty())
		bRet = false;
	//else
	//	imwrite(pchMaskPath, mask);

	return bRet;
}

int main()
{
#ifdef SEGMENT_WEBCAM
	runSegmentationWithCam();
#else
	segmentPath("image.jpg", "mask.jpg");
#endif
}
