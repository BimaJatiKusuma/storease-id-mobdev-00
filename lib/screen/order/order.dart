import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/color/color.dart';
import 'package:storease_mobileapp_dev/model/orderResponseModel.dart';
import 'package:storease_mobileapp_dev/screen/order/orderDetail.dart';

class Order extends StatefulWidget {
  final OrderResponseModel orderData;
  const Order({super.key, required this.orderData});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  int currentStep = 0;
  int selectedStep = 0; // Tracks the step whose content is being shown.

  @override
  void initState() {
    super.initState();
    currentStep = mapStatusToStep(widget.orderData.status);
    selectedStep = currentStep;
  }

  // Function to map status to step index
  int mapStatusToStep(int status) {
    switch (status) {
      case 1:
        return 0; // Penentuan Jadwal Rapat Perdana
      case 2:
        return 1; // Rapat Perdana
      case 3:
        return 2; // Pembayaran Awal
      case 4:
        return 3; // Persiapan Awal
      case 5:
        return 4; // Pembayaran Akhir
      case 6:
        return 5; // Persiapan Akhir
      case 7:
        return 6; // Hari Pernikahan
      case 8:
        return 7; // Pelaporan Akhir
      default:
        return 0;
    }
  }

  onStepTapped(int step) {
    setState(() {
      selectedStep = step; // Update the selected step to show content
    });
  }

  // Customizing the step state to change color for completed, current, and other steps
  StepState getStepState(int step) {
    if (step < currentStep) {
      return StepState.complete; // Completed steps are green
    } else if (step == currentStep) {
      return StepState.editing; // Current step is purple
    } else {
      return StepState.indexed; // Other steps are grey
    }
  }

  Color getStepColor(int step) {
    if (step < currentStep) {
      return Colors.green; // Green for completed
    } else if (step == currentStep) {
      return MyColor.color1; // Purple for current step
    } else {
      return Colors.grey; // Grey for others
    }
  }
  Color getStepConnectorColor(int step) {
    if (step < currentStep) {
      return Colors.green; // Green for completed
    } else if (step == currentStep) {
      return Colors.purple; // Purple for current step
    } else {
      return Colors.grey; // Grey for others
    }
  }

  Widget controlsBuilder(context, details) {
    return SizedBox.shrink(); // Disable the next/previous buttons
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ORDER"),
      ),
      body: SafeArea(
        child: Stepper(
          connectorThickness: 2,
          // connectorColor: WidgetStateProperty.all(getStepConnectorColor(currentStep)),
          currentStep: selectedStep, // Show content based on selectedStep
          onStepTapped: onStepTapped, // Enable tapping on any step
          controlsBuilder: controlsBuilder,
          steps: [
            Step(
              stepStyle: StepStyle(color: getStepColor(0)),
              title: Text("Penentuan Jadwal Rapat Perdana"),
              content: OrderContent(currentStep: selectedStep),
              state: getStepState(0), // Use custom step state
              isActive: true, // Keep steps active
            ),
            Step(
              stepStyle: StepStyle(color: getStepColor(1)),
              title: Text("Rapat Perdana"),
              content: OrderContent(currentStep: selectedStep),
              state: getStepState(1),
              isActive: true,
            ),
            Step(
              stepStyle: StepStyle(color: getStepColor(2)),
              title: Text("Pembayaran Awal"),
              content: OrderContent(currentStep: selectedStep),
              state: getStepState(2),
              isActive: true,
            ),
            Step(
              stepStyle: StepStyle(color: getStepColor(3)),
              title: Text("Persiapan Awal"),
              content: OrderContent(currentStep: selectedStep),
              state: getStepState(3),
              isActive: true,
            ),
            Step(
              stepStyle: StepStyle(color: getStepColor(4)),
              title: Text("Pembayaran Akhir"),
              content: OrderContent(currentStep: selectedStep),
              state: getStepState(4),
              isActive: true,
            ),
            Step(
              stepStyle: StepStyle(color: getStepColor(5)),
              title: Text("Persiapan Akhir"),
              content: OrderContent(currentStep: selectedStep),
              state: getStepState(5),
              isActive: true,
            ),
            Step(
              stepStyle: StepStyle(color: getStepColor(6)),
              title: Text("Hari Pernikahan"),
              content: OrderContent(currentStep: selectedStep),
              state: getStepState(6),
              isActive: true,
            ),
            Step(
              stepStyle: StepStyle(color: getStepColor(7)),
              title: Text("Pelaporan Akhir"),
              content: OrderContent(currentStep: selectedStep),
              state: getStepState(7),
              isActive: true,
            ),
          ],
        ),
      ),
    );
  }
}

class OrderContent extends StatelessWidget {
  final int currentStep;
  const OrderContent({super.key, required this.currentStep});

  description<String>() {
    switch (currentStep) {
      case 0:
        return "Tahap Penentuan Jadwal Perdana, adalah tahap untuk customer dan tim storease melakukan rapat pertama. Admin akan menghubungi customer sesaat setelah customer membuat pesanan. Customer bisa menghubungi tim storease apabila belum mendapatkan konfirmasi jadwal rapat perdana";
      case 1:
        return "Tahap Rapat Perdana, adalah tahap untuk customer dan tim storease melakukan rapat pertama. Admin akan menghubungi customer sesaat setelah customer membuat pesanan. Customer bisa menghubungi tim storease apabila belum mendapatkan konfirmasi jadwal rapat perdana";
      case 2:
        return "Tahap Pembayaran Awal, adalah tahap untuk customer dan tim storease melakukan rapat pertama. Admin akan menghubungi customer sesaat setelah customer membuat pesanan. Customer bisa menghubungi tim storease apabila belum mendapatkan konfirmasi jadwal rapat perdana";
      case 3:
        return "Tahap Persiapan Awal, adalah tahap untuk customer dan tim storease melakukan rapat pertama. Admin akan menghubungi customer sesaat setelah customer membuat pesanan. Customer bisa menghubungi tim storease apabila belum mendapatkan konfirmasi jadwal rapat perdana";
      case 4:
        return "Tahap Pembayaran Akhir, adalah tahap untuk customer dan tim storease melakukan rapat pertama. Admin akan menghubungi customer sesaat setelah customer membuat pesanan. Customer bisa menghubungi tim storease apabila belum mendapatkan konfirmasi jadwal rapat perdana";
      case 5:
        return "Tahap Persiapan Akhir, adalah tahap untuk customer dan tim storease melakukan rapat pertama. Admin akan menghubungi customer sesaat setelah customer membuat pesanan. Customer bisa menghubungi tim storease apabila belum mendapatkan konfirmasi jadwal rapat perdana";
      case 6:
        return "Tahap Hari Pernikahan, adalah tahap untuk customer dan tim storease melakukan rapat pertama. Admin akan menghubungi customer sesaat setelah customer membuat pesanan. Customer bisa menghubungi tim storease apabila belum mendapatkan konfirmasi jadwal rapat perdana";
      case 7:
        return "Tahap Pelaporan Akhir, adalah tahap untuk customer dan tim storease melakukan rapat pertama. Admin akan menghubungi customer sesaat setelah customer membuat pesanan. Customer bisa menghubungi tim storease apabila belum mendapatkan konfirmasi jadwal rapat perdana";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Text(description()));
  }
}
