OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[4];
cx q[15], q[0];
x q[14];
cx q[18], q[4];
cx q[9], q[19];
