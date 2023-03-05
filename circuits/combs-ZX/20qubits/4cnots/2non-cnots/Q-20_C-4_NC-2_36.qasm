OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[6];
x q[3];
cx q[18], q[7];
cx q[7], q[10];
z q[13];
cx q[13], q[5];
