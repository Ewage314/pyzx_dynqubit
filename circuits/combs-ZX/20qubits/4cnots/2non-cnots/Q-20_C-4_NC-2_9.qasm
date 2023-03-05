OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[15], q[14];
cx q[18], q[6];
x q[19];
cx q[5], q[8];
x q[7];
cx q[4], q[5];
