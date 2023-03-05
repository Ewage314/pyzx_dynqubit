OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[0], q[1];
z q[14];
cx q[10], q[2];
cx q[18], q[8];
z q[17];
cx q[19], q[0];
