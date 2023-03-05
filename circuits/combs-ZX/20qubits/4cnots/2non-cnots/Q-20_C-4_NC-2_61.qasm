OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[14];
cx q[18], q[14];
x q[19];
cx q[15], q[14];
cx q[7], q[6];
cx q[12], q[0];
