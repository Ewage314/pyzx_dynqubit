OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[13];
cx q[15], q[0];
x q[3];
cx q[7], q[14];
cx q[18], q[19];
cx q[0], q[9];
